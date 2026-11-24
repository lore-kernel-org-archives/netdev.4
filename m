Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795556441;
	b=twQPzbSoCLV08uB/Ye8hZVFu9zIwwpfB0OgkAXWXPXqk/xIdD1aUubBmk1LtrTxZm8DM
	 2OPLAaOTjyOF4J95Ycyb0NdfxdxCY1cg2xleqVDyB46voNdKM9N6DBWSAURtPCf5m7CWY
	 k6neB/ygb4P/MI/So4HQPiapkMpq+/AvIDmLMu1xHSi67ln5EDfXVC6zpGcJKiQCy3Tkw
	 XI19sZHcftmyI/HOdmKQ+w6iy1RSKyccd/ZVy4kEV45yjQeAWJ0Hwbh5xNfkwhnkOdvIl
	 eOmdq7/zGv+UrNrnjUDx27hL7RmN9UCojaO1cLh/DMddwyhc+GbP+paAUTYkpPMhtAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8vTHmqosNip4PzWeUJYtggJ3iETjixMqdrHE7e2DIQU=;
	b=ShfF6LT0fINokmGoTojwuJgIbPa6NkO3nciP5vKbyQcY+l+5UTEsXwGi1tFsd2vzYlt6
	 WDXR3bIvjYYYbOjPCpVh+b3SHHmxdpsW/fd/qBWPOhqfUAmSdIDPZ8zncOrKdqy2PhBvw
	 jo8BSitsfNFammHjeAgtt5cjnW0Znk86rJJ1BZpOr+n9FdPnUjs23bb8xDvcUNZ2Zuerm
	 Mv6RB0RFJMSufWuBWRMLTjCYNYyOQW+sOyvWv5Ou5mdbP5rGMaDSRf2QDrKc9z79Drful
	 EnUYCYrwhOYswjFVPZsWJ06kUQSC1Bkud3HVtx7RDqlYnFsvQL6Kq7dVfiP8gm75KJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0dm8TZPn;
	arc=none smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB24606A337
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:40:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCB24606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0dm8TZPn
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7d2ccd3c7a2so1693556137.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 13:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795556440; x=1796161240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8vTHmqosNip4PzWeUJYtggJ3iETjixMqdrHE7e2DIQU=;
        b=0dm8TZPnqEQFkRwrXxHnx5HZPGepIu1i6nigAX8fz59SVnfIllA8zMxlg3Qi9rP5Cg
         7ClvnriYq4VPEpzMNIS3/f8hggdOpXqQdl3PPfA2Oj8Hjl2Sa5Hbfhfp334XFOefTygp
         sObv+L1JJcptSBZf0n86Jfe7pgshaMgdFHPa9w3f6WSQSS2lDo1kvreb5PZYZGOfASXS
         2Uvxd/y/Aar6NS3QS/KoCASWJJLTnEj63HO7XKyBhwG8JvCGCZeyNduZeNG7776oJVTb
         5sqlxeuIzjpa5Jj0XO9Mrd4a0Wm2x+0wKX43lKE5COetTQqfkPwO//WKpKovDnUblHZo
         uWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556440; x=1796161240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8vTHmqosNip4PzWeUJYtggJ3iETjixMqdrHE7e2DIQU=;
        b=gFG49rH3FpUsDe4jj+iHOaxLCsPT0jqo01COJxUBsMlm9zKCXHAxu6HPPEuudh/1Ak
         9jJTlSLJyniBU8/3TDi1crVqw4x3a8BYhVbvcVRRSL+bksI5aCDi8B8o1rJl4G/xRw7Z
         8dEWXjBbozfBd9PyT5tOm4oMb8+iaK/GDBhlYBCyuxJV0HVwYBWf6vgpEu+y+8JSAocS
         nhn0oYBKCt6TPhGfycpngF2BsZtpWpZfHV6HR+2XoqH4GsMbbX7OBApVFiYTq8Z+7YI7
         NojkIWeVLzU4LKefI4VophyndRedYKjkoEBW6O0I65TTD3nMuLFdY+KvNRbahYu49gMd
         IS4A==
X-Forwarded-Encrypted: i=1; AL+hErFaa/kFJUMb/b3cXcIGcDl3lWQ/XlZgyYCVsj6aRR0b8fgeYVy/nRpsLWmNk1TvqMfzG8MF148=@vger.kernel.org
X-Gm-Message-State: APuU4Z8X3ugw4gpYRWf63aSbGFyH8YCUvwQqad0hwUeHxZarA6c7Fbfy
	2K5kZW0WV/+xHXr22tAofP2jD2LqzsDJRJn7RXqG3YJFUCIXU9sfd7Cw
X-Gm-Gg: AZFdTZfm7IXQ9P1anWxxNLhNRIkMBORn1OSOE6orI/bdFfRxRlQpG2qtnDjlztwibq4
	HlU/aih4pFX998O+tNGxj1/nBNe8rhhETcfQzgYrVR2a8aEzUm5DZ2StQQzcKo5GU45vo2M+ChW
	zgmY8vByeekViKaP7X8Ehu67BpMJZZoEuZFkkWKf4T7bCaWZrkUK9FoBpjIKbxZmD1nwW0fX63k
	3UnAWGKBAQzrWEYLnjwmthmntFdZaUqaFj8buAUAtGCLtSU2ODoyf9XDyiIYPAEaQyQONtB/2LU
	S4PhnTPko96t/CDGmMMW4xfACi3zWNG6SD2JEtNoC7iEgguaz9OuiE2rUdsLaFltalgSf4urUmW
	cVxwFWV8HJ1Eq7FUEWjbd8rgISzO5Ar8M2VI/THTaax5yKCFreRNrLNoQb4TWSkmqwjLsUmbisY
	/O+iZ7u0imUzeOv1rZmxpSC2sJoSTEERELs2B0pM5syvdmcDP1pFhuZR4pcavHitjWJ6+bczKlD
	pS/Zz/7C3q+tWAfVDSwst8lP2cv16Nu4AHcN5uj/B19CYB21VvfhpbOwXI1fTOAoEIAwiSFzwLf
	IgyIIUk2HpH1g0werCN7HMzHXTl3q+5JkN/lcnyF0Ff5i3WFK/XO
X-Received: by 2002:a05:6102:292a:b0:7a6:d11b:16ea with SMTP id ada2fe7eead31-7d73935fb84mr8027697137.6.1795556439674;
        Tue, 24 Nov 2026 13:40:39 -0800 (PST)
Received: from emedev.tailf75c28.ts.net ([179.238.117.100])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6dec57ddsm15952879241.1.2026.11.24.13.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:40:39 -0800 (PST)
From: Emerson Busson <emersonbusson@gmail.com>
To: Wei Liu <wei.liu@kernel.org>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Dexuan Cui <decui@microsoft.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Kelley <mhklinux@outlook.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	Kameron Carr <kameroncarr@microsoft.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-hyperv@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] hv: vmbus: make rings and host-visible buffers survive buddy fragmentation
Date: Tue, 24 Nov 2026 18:40:26 -0300
Message-ID: <20261124214030.174246-1-emersonbusson@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Opening new VMBus channels or subchannels can fail with -ENOMEM under
memory fragmentation even when plenty of order-0 pages are free, because
vmbus_alloc_ring() asks for a single high-order contiguous block (order-7
for a 512 KiB ring) and vmbus_alloc_requestor() uses contiguous
allocations for its request array and bitmap.

Based on Michael Kelley's review of v1 and the v2 feedback from Wei Liu
and Michael Kelley, v3 goes back to the core VMBus allocation path. It
groups buffer and GPADL state into struct vmbus_buffer, allocates ring
buffers through vmbus_alloc_buffer(), drops struct vmbus_gpadl along
with the duplicate decrypt/re-encrypt paths, and switches requestor
metadata to kvcalloc().

Changes since v2:
- Dropped the reclaim workqueue, UIO page-pinning layer, and KUnit tests
  to keep this series focused on VMBus buffer and ring allocation.
- Split the hv_netvsc fixes and allocations out for separate net /
  net-next submissions.
- Preserved hv_netvsc's revoke-failure leak guard before GPADL teardown.
- Rebased onto hyperv-next.

v1: https://lore.kernel.org/linux-hyperv/20260918014017.2536753-1-emersonbusson@gmail.com/
v2: https://lore.kernel.org/linux-hyperv/20261007190752.336426-1-emersonbusson@gmail.com/

Tested with x86_64 (W=1 C=2) and i386 builds, a local QEMU/KVM boot with
lockdep enabled, and a backport onto 6.18.64.1 running live on Hyper-V
x86_64 (85 VMBus channels, 12 netvsc queues, uio_hv_generic loaded).
Confidential VM paths (SEV-SNP, TDX, Arm64 CCA) were compile-tested and
reviewed by inspection only.

Emerson Busson (3):
  hv: vmbus: encapsulate buffer and GPADL state in struct vmbus_buffer
  hv: vmbus: allocate ring buffers via vmbus_alloc_buffer()
  hv: vmbus: allocate requestor metadata with kvcalloc()

 drivers/hv/channel.c            | 363 +++++++++++++++-----------------
 drivers/hv/hyperv_vmbus.h       |   4 +-
 drivers/hv/ring_buffer.c        |  17 +-
 drivers/net/hyperv/hyperv_net.h |  10 +-
 drivers/net/hyperv/netvsc.c     |  64 +++---
 drivers/uio/uio_hv_generic.c    |  97 ++++-----
 include/linux/hyperv.h          |  43 ++--
 7 files changed, 271 insertions(+), 327 deletions(-)


base-commit: eab80895d447ec164a1d91a1ab377bd3a9dc9044
-- 
2.43.0

