## Label Flow

This script is intend to change the label of the flow based on the source and destination IP.

### Adding executable permission for the script
```sh
chmod +x ./label.sh
```

### Usage
> ```sh
>./label.sh -s <src ip> -d <dst ip> -l <label | class > -f {filename} -b {true|false}
>```

The provided file must be of type CSV (Comman Seperated Variable) file.

### Example
```sh
./label.sh -s 169.254.107.171 -d 169.254.107.171 -l DOSATTACK -f hulk.csv
```
```sh
./label.sh -s 169.254.107.171 -d 169.254.107.171 -l DOSATTACK -f hulk.csv -b true
```

The above command will replace the label for all the flow's with source IP 169.254.107.171 and destination IP 169.254.107.171 to "DOSATTACK" in the hulk.csv file.

if -b flag is set to true, then the reciprocal i.e. src will be also check as dst and dst will be also check as src.