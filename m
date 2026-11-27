Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795760458;
	b=P15uQEXjT8AaibzfnUfgVBU65S9QgDXDprdImTTsabjjhAUDYTz0f/22jc9Mu8CQDVfY
	 b80OOp3D0408LPz65gAV/w6NytS0Axk23h8Jg5/DnqZuYLMYF4pJHmle/oa/GvUGE3lEl
	 mmagz/uOAK5L0OeToSOwuYsMAkrjnn6k76NBZL8vm4S8p/rEMHa7FkCrS0HwR6Eo66tj6
	 VTMRNgQNs3Lwu3neCrdHwzWFKOutmHSyi1DwO42/U5oFTuXhKjq59TaF08C4eTSYlTy6l
	 tGqOleVp6mahDjOj0ShbGLe9dLX6MsZl98xfAsAXW5WnJfvxNYAgjNqdpzc3KsBE6ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795760458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Mj7VdG614iEFC4f6R8a3eu/YkBaqsbzabkLhl6xyJ9g=;
	b=psIsML187i4ON3rOzVltrPZqmRJpfzg9zv1E6l23ye3UCp5uOiTWnVr/HILgIuNJ4/3Z
	 GUoHQI9bMrus3RNW/eMFPJgbbScNyT/j4uH+MjluIuimKsaejjwRu09sR4u90TxYsRaFr
	 jviVvMciSz6+yMxBTYEMMbg7PriHZzy1JPdfex1K3RbcoZ7WiGK6Vj4va1e+/SpLACzRa
	 biJkCsS2nT5/xQjTT7SbFT0j5ur7LsS0aQ4HKdSwiektG/R5odFk9qMJrhGm3T1xfqNbJ
	 fhPwIAwguN0AYVpKBiv7vUoZavJ2miqfJM7H01PBxZMsI9RVwJAN8eEAbatts8CwFxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nebusec.ai;
	spf=pass smtp.mailfrom=nebusec.ai;
	dkim=pass header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=EzU2QqTv;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044AC606A323
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 06:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 044AC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=EzU2QqTv
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cd69954c755so5603646a12.3
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 22:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1795760457; x=1796365257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mj7VdG614iEFC4f6R8a3eu/YkBaqsbzabkLhl6xyJ9g=;
        b=EzU2QqTvs2fmfjNEreiScbjCK4FoM/KpZ2iE1Cbs8B1LtBeYS3siFdWhh2ww309Qbg
         /KxeblNH8rNIZ/HRk3hJr1NJWNsqipo+g3Ancut3kY4fmGQYfXwtw3bRj7kyuaUmfC9E
         oHdbLUwHd8auFrSE/mqewRnfoF5mmgQH+GUECpvAHnoXS1ChI3sKFgDYld0jjY1FvKFv
         YqLYOb7XEGZStodcoyB6bpCiUnb3Pk+p0ZxuzDfsERzYdTx6QUyt+oTekvki9g+7wVAM
         X6cETEvZ3Ad/cSbfoIzElDUybLEGgneZpLSy5yOMM/LCdCjJJsw6vEcJlvt5+IHjrSWS
         SMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795760457; x=1796365257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mj7VdG614iEFC4f6R8a3eu/YkBaqsbzabkLhl6xyJ9g=;
        b=FB08s4OLpMx8gxsIrUhCS6BTX+MfJeFaFoAi0TRgnhaU050D3EZexjNB4LTVrHBBLA
         aix5SS0tGEQoF7MNsg2/pSmkp2lIoX6950q1IZuwf7Nawq3Ky3DxbxJXaFtajNOL1pP1
         IwbPOp+Qpv8mXqpG+M+gXqcwu0syh3cXiuEK5fIRt2+ch3Ns4Q1pUS3XVtFZB4OP9nwr
         tvuDMfsZvRNubGkIUc2/l75y5wN8ZpFah1J/hkM+kgCp0jBZ9mpsj0Um7FLiOvOR1GRN
         Qzvszc+E3JX8/LcsyyX1mmgqogJOa2TO0p4pVx6A3aERk40XgD5uWD9KEyK80JRe+KV5
         cuWA==
X-Gm-Message-State: APuU4Z+frsxQJzKtDx7ad7KsSiza2r5LgJcQ/OCgReEvxamgn7BBTzQB
	JAJNLNFoSwGWAqRQfsmWgEPf+1TvtpHf+O/7Z99EpgKuUcgnhwIaTxT4kxM+NKiPiZRoc8uldSv
	MldE6cA==
X-Gm-Gg: AZFdTZcSpZhsBUyiO3NSgDWB4an9g9fgkHtOljbSn0+YsG9dNUSIjJIzAly2QRcdt6/
	4kp3zLqx4eAyrHXjYqPDUNwOWdsP7ITkwgX9U1j9zkzCGNcJzyxi/p2eu5H+YYEORI2NyQ8RAEl
	jzdmRWUF6mWHZ5lE4wH9LsGEDt8wuNivlyzPzDRyGHucF3twx8FDVmIoOAeOjtxu8rEsL+FEYhK
	y+SamKuQkGfo1nPo8CHLon9FQKkBcWdq/J5XH/yIGCP2qMr7vu9H64BGZsYaNST9QWbVJl07G8R
	Mi3MrWA/mB1BuR8qG3QTLjcy/RFDg7N0kFGP50odDxQj/c6imoI8PAOQiY87LLjM2IEtO2mjDWs
	kwtjBcnYRBe8ic3z7hGjieu+Vi0YsnC3RwNRgJ9hafJkmJ1elTYcxPoQQlTaBZGIRQb1aHZKseb
	WkrTaZPAysK26JsM79IiJveECOyc9nnmWQGdKZ9c5/vWr1tAteZxV9RiMWE/kCpRGxsYVrUdMZu
	A435NkgV0NJXV8qgvCA+d0Lk4vcyA7mpCUhU62zIAt4YUK8Ts/5WKFQCzICNO3X5UCnB3sabXxs
	HnHZJ6CUpmJ4JQT+hqMGGlrscOJ5KdyEaNvY2vcF
X-Received: by 2002:a17:90b:248e:b0:3b5:9a2:c8ab with SMTP id 98e67ed59e1d1-3b509a2c972mr4362700a91.67.1795760457203;
        Thu, 26 Nov 2026 22:20:57 -0800 (PST)
Received: from enjou-Legion-Y7000P-2019 ([174.136.206.51])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm36939740a91.2.2026.11.26.22.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:20:56 -0800 (PST)
From: Ren Wei <weir@nebusec.ai>
To: netdev@vger.kernel.org
Cc: jiri@resnulli.us,
	ivecera@redhat.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	willemb@google.com,
	horms@kernel.org,
	chi.minghao@zte.com.cn,
	vega@nebusec.ai,
	caoruide123@gmail.com,
	weir@nebusec.ai
Subject: [PATCH net 0/1] switchdev: fix deferred item flex-array allocation size
Date: Fri, 27 Nov 2026 14:20:50 +0800
Message-ID: <cover.1795576931.git.caoruide123@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ruide Cao <caoruide123@gmail.com>

Hi Linux kernel maintainers,

We found and validated an issue in net/switchdev/switchdev.c. The bug
is reachable by root with CAP_NET_ADMIN. We've tested it, and it should
not affect any other functionality.

This bug is tracked at: https://bugtracker.nebusec.ai/f/10431

We will provide detailed information about the bug in this email.

---- details below ----

Bug details:

switchdev_deferred_enqueue() stores a byte payload in the deferred item
flexible array, and data_len is a byte count. The array is declared as
unsigned long data[], and kmalloc_flex() treats data_len as an element
count, so every deferred attr or object item is allocated
sizeof(unsigned long) times larger than intended (8x on 64-bit). The
subsequent memcpy() copies only data_len bytes, so this is not an
out-of-bounds write; it is an 8x GFP_ATOMIC over-allocation that makes
those atomic allocations more likely to fail.

This patch declares the payload as u8 data[] __aligned(sizeof(unsigned
long)). The offset of data does not change, because the preceding
members are pointers (or an empty tracker). The aligned attribute
documents the existing alignment contract.

Reproducer:

The issue is reachable as root with CAP_NET_ADMIN. Create a VLAN-aware
multicast-snooping bridge, attach veth ports, add several bridge VLANs
on the bridge itself, and add a host MDB entry without a VID. Leaving
the VID unspecified makes the bridge replicate the join across every
bridge VLAN, and br_switchdev_host_mdb() then defers one HOST_MDB
object per lower port into switchdev_deferred_enqueue(). With a modest
setup, for example four veth ports and bridge VLANs 1-11, a single

    bridge mdb add dev br0 port br0 grp 239.1.1.10

is enough to observe the oversized GFP_ATOMIC allocations.

We ran the PoC in a 2 GB RAM x86 QEMU environment.

------BEGIN PoC------

#!/bin/sh
set -eu

if [ "$(id -u)" -ne 0 ]; then
	echo "run as root" >&2
	exit 1
fi

ip link del br0 2>/dev/null || true
for i in 0 1 2 3; do
	ip link del "v$i" 2>/dev/null || true
	ip link del "p$i" 2>/dev/null || true
done

ip link add br0 type bridge vlan_filtering 1 mcast_snooping 1
ip link set br0 up

for i in 0 1 2 3; do
	ip link add "v$i" type veth peer name "p$i"
	ip link set "v$i" master br0
	ip link set "v$i" up
	ip link set "p$i" up
done

# VID 1 is the default PVID; add 2-11 on the bridge itself.
bridge vlan add dev br0 vid 2-11 self

bridge mdb add dev br0 port br0 grp 239.1.1.10

------END PoC--------

----BEGIN crash log----

On the Linux 6.12.94 x86_64 guest, pahole reported
sizeof(struct switchdev_deferred_item) = 32 (empty netdevice_tracker)
and sizeof(struct switchdev_obj_port_mdb) = 56, so a deferred HOST_MDB
item requested 32 + 56 * 8 = 480 bytes instead of 32 + 56 = 88. With
CONFIG_SLUB_DEBUG=y, kmem:kmalloc traces at switchdev_deferred_enqueue
showed:

    call_site=switchdev_deferred_enqueue+0x2b/0xf0
    bytes_req=480
    bytes_alloc=1536

A deferred attr item is the same error by type math on the same pahole
sizes (32 + 48 * 8 = 416 bytes instead of 80); that figure is not from
a separate slab trace. After-fix bytes_req and bytes_alloc were not
measured on this setup.

-----END crash log-----

Best regards,
Ruide Cao

Ruide Cao (1):
  switchdev: fix deferred item flex-array allocation size

 net/switchdev/switchdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)


base-commit: 32756b82fde8f6cc98b174fdcd02c2a61033e263
-- 
2.47.3

