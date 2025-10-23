@extends('layouts.auth')

@section('title', 'Atlas Hosting Login')

@section('content')
<div class="login-card">
    <img src="{{ asset('logo.png') }}" class="atlas-logo" alt="Atlas Hosting Logo">
    <div class="atlas-title">Atlas Hosting</div>
    <form method="POST" action="{{ route('auth.login.post') }}">
        @csrf
        <div class="form-group">
            <label for="username">Email or Username</label>
            <input type="text" name="username" id="username" class="form-control" required autofocus>
        </div>
        <div class="form-group mt-2">
            <label for="password">Password</label>
            <input type="password" name="password" id="password" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary mt-3 w-100">Login</button>
    </form>
</div>
@endsection