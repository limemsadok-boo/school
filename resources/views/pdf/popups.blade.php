<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Popups List</title>
    <style>
        body { font-family: sans-serif; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f5f5f5; }
        img { max-height: 50px; }
    </style>
</head>
<body>
    <h2>Popups List</h2>
    <table>
        <thead>
            <tr>
                <th>Id</th>
                <th>Address</th>
                <th>Description</th>
                <th>Is Active</th>
                <th>Image</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($popups as $popup)
                <tr>
                    <td>{{ $popup->id }}</td>
                    <td>{{ $popup->address }}</td>
                    <td>{{ $popup->description }}</td>
                    <td>{{ $popup->is_active ? 'Yes' : 'No' }}</td>
                    <td>
                        @if ($popup->image)
                            <img src="{{ public_path('storage/' . $popup->image) }}" alt="Popup Image">
                        @else
                            -
                        @endif
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
</body>
</html>
