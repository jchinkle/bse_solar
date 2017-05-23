def load_fixture_path(path)
    Rails.root.join('spec', 'fixtures', path)
end

def load_fixture(path)
    File.read(load_fixture_path(path))
end
