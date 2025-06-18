from flask import Flask, request, jsonify, abort
from pymongo import MongoClient
from bson import ObjectId
import os

app = Flask(__name__)

# MongoDB connection (adjust as needed)
MONGO_URI = os.getenv('MONGO_URI', 'mongodb://localhost:27017')
client = MongoClient(MONGO_URI)
db = client['taskdb']
tasks_collection = db['tasks']

# Helper: Convert ObjectId to string for JSON responses
def serialize_task(task):
    task['id'] = str(task['_id'])
    del task['_id']
    return task

@app.route('/tasks', methods=['GET'])
def get_all_tasks():
    tasks = list(tasks_collection.find())
    return jsonify([serialize_task(task) for task in tasks]), 200

@app.route('/task', methods=['POST'])
def add_task():
    data = request.get_json()
    if not data or 'title' not in data:
        return jsonify({'error': "Missing 'title' field"}), 400

    task = {
        'title': data['title'],
        'description': data.get('description', ''),
        'status': data.get('status', 'pending')
    }
    result = tasks_collection.insert_one(task)
    task['_id'] = result.inserted_id
    return jsonify(serialize_task(task)), 201

@app.route('/task/<string:task_id>', methods=['GET'])
def get_task(task_id):
    try:
        task = tasks_collection.find_one({'_id': ObjectId(task_id)})
        if not task:
            abort(404, description="Task not found")
        return jsonify(serialize_task(task)), 200
    except:
        abort(400, description="Invalid task ID format")

@app.route('/task/<string:task_id>', methods=['DELETE'])
def delete_task(task_id):
    try:
        result = tasks_collection.delete_one({'_id': ObjectId(task_id)})
        if result.deleted_count == 0:
            abort(404, description="Task not found")
        return jsonify({'message': f'Task {task_id} deleted'}), 200
    except:
        abort(400, description="Invalid task ID format")

if __name__ == '__main__':
    app.run(debug=True)
