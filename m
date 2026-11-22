Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795338374;
	b=0Zh7bTewzj06JrZiYWJ5eFklKvpyqjMcMZsHLnuvMYS7ZFL6B4vLVyLC6N51MvwoQ4VC
	 Z+lrVNBnJA6Ww75Oxtwa/NqauLJwnVUmS5SvcZJDA0QtNCV2d2W/Lsd/MFN/uFRlO2Ius
	 8AqPai+6nWj4r9aIpPGB1E3rNIChENsNYXMJnVCiR0D4MdNFLE1r63TQRAyODNnwUmHd0
	 mpNZhlBAHoQk1uPAgFUv+tVeMS/5cEHvrQeBoaBcudFmcWPKvgvdwGnXXvAjurwQmP86T
	 VmtJjic0hUed0I3/KpWHu926zAIJg5c0BnqB8ygjIxH94ARPSjcke8i1TrGFQznEehA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795338374;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=8vOXTOFvnrcmfNX9TrDkyysz8FDRPCViCUHoqkPWXYc=;
	b=xutbHSPoOmSBVYGfbVsKpEQTQf+s0h7jDQ9bq9JgW1L/DJWXfZ3jKzVHys/X0JL97Tu8
	 cPBvrz03qaYgZCX1j8pfdEPKZD0mHX7inMXBKJpMGIFOL0giiIdLT8yMp4j9lvCDL2SYE
	 BvxMwkmVqPiWPy2WWMzEvhOhfUj/gLkpacA42GrSkWq8Wpt+NLIjLhEiwmQhBoGKgOuM4
	 1bDvb3b9LRJTf/UgrMOy8ikhemwXj1P7LBHvGW1LYPVJO1zulK2uAl780xOQ3wkYbWKU3
	 bVRo5Q9yUh0Q4+d+hHyjvHpxmZcTJRfnnhE8Z1XSY5L5u2QayBmcMwkazxa8vaomcKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=foxmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.229.131
Received: from mail-dl2-f3.google.com (mail-dl2-f3.google.com [74.125.229.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43002606A320
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 09:06:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43002606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl2-f3.google.com with SMTP id a92af1059eb24-1521c45a248so2025258c88.0
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 01:06:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795338372; x=1795943172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8vOXTOFvnrcmfNX9TrDkyysz8FDRPCViCUHoqkPWXYc=;
        b=xvCR1YaKAvftKHABYj38eQNH7LxT58eNP24tmW0S/xBzGZmYGO1tj2RbfxMcZWrnUp
         QAs4WrlsXBiJGiVCOyaLdjKYZFTWSk7RvhIb9EDZYoKBVvqxzTQhDrtpALwX1zYJRIbv
         B1p6leYvoHiaVaOqw1yWk8Q0Fqvam6pBIcQLWlNxL7qT2CD+dBVRk6DnC1hWJYiMqTm8
         r1zXaXJdxw0hSMBVmUXd23oyvSTV+fIdcV0g65i/NKIFBt79JSqctgcmgda+ewpgpMwI
         nNsW67e/EhfCp0H8/iksLWKQoulR4JgfiYFh9UOXE3L2A9auwaKkSfZoFhIvQspvjeYl
         Y2Ig==
X-Gm-Message-State: APuU4Z9OAWMYipC0TOd5Wfjd6Sh3fEz3GqpumOu6P1JTnq/QKzjsA9Tk
	G+ZpPMnHRNLjA5pQCeTQgpG3KLLvmpkQ6+hFXm5iyVR9swAKShRMrYESd1XmKgtl
X-Gm-Gg: AZFdTZd+2sqVWZWGL+TZ7E4+I9MhLzy0drzvmMP5/SyHa9ad9iKtu0aIWOW3XP/uOoq
	MaCyE+XIk+stsU+RJMLIK92pUVzxrI+vk0ZRGkMxvgz4u1KZvFAg56+5Nf6AZtRboItlWwKIpMw
	E+KBg8Bh8BmAYQCfDID1ZVvo4f3v0pUW+zwW3VtlY0Lh8HHIBY7uRauVlZoqb2eKtmP4w74Ukl6
	jgHoVKW/zY4lPVRPxZNvcFSYmlfgOYfLlWwME2oCNsNoPQsDLxkbOwFB9UUHB7+HjgM6vz1qzRj
	pAfJibGWyP2af7yROyXxIx7jvni842nu7UzjTYQzKDuLExSNw86xurAIKbM15q3uUrGtHdh2vvx
	iYnkEguy0io8Oc2vZOb2/FYWD1YwYt2//dwTjdlUeXmmMylC/9mxnwoWDiIpFcMrmZDfCwIddEj
	G8+LNmJRVtIO4ihSUlgXIZhHfhRBEN4Y0nk3sslTepIKanC4TtuyafUwXT4XPpWxeeaMBoFESdv
	eo8fOkMJJ/iivYEJmRuHUR6rL/0pStTqz/n6IVd3rB3LyAATpbW31hmwwo6yvT5MZIrnbPoxdKM
	Z+jhmL5XLssEpk/4PXlpREUJCrfxuOO9UCVcHCafXHYRXlA=
X-Received: by 2002:a05:701b:4308:b0:165:aced:1fde with SMTP id a92af1059eb24-1b56f87a910mr814282c88.0.1795338372101;
        Sun, 22 Nov 2026 01:06:12 -0800 (PST)
Received: from localhost.localdomain ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b562a82b3fsm16839045c88.5.2026.11.22.01.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:06:11 -0800 (PST)
From: Jianlin Shi <shijianlin11@foxmail.com>
To: netdev@vger.kernel.org
Cc: mst@redhat.com,
	jasowang@kernel.org,
	eperezma@redhat.com,
	xuanzhuo@tsinghua.org.cn,
	andrew+netdev@amiga.org.uk,
	davem@davemloft.net,
	edumazet@gmail.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	talgi@efi.com,
	hengqi@loongson.cn,
	horms@kernel.org,
	virtualization@vger.kernel.org
Subject: [PATCH net v3 0/2] virtio-net/dim: fix irq moderation init failure unwind
Date: Sun, 22 Nov 2026 17:05:55 +0800
Message-ID: <20261122090557.19766-1-shijianlin11@foxmail.com>
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

net_dim_init_irq_moder() leaves dev->irq_moder dangling when
profile allocation fails.  virtio-net probe then skips the
virtqueue teardown if that init fails after init_vqs(), leaking
the virtqueues and their DMA mappings.

Patch 1 makes the dim init failure path clear dev->irq_moder, so
net_dim_free_irq_moder() is a no-op afterwards.  Patch 2 sends the
virtio-net failure through the existing free_irq_moder unwind
(reset + del_vqs), matching the page-pool failure path.  Patch 2
depends on patch 1.

Changes since v2:

- Resend as a new thread with a [PATCH net] subject prefix, as
  requested by Michael S. Tsirkin.
- No functional changes.  Both patches are identical to v2.

Changes since v1 [1]:

- Patch 1's commit message now documents the call sequence the
  maintainer asked for: on current mainline the dangling pointer
  is never dereferenced by the only in-tree caller (virtio-net
  probe does "goto free", which only reaches free_netdev()).  It
  becomes reachable once the caller unwinds through
  free_irq_moder as patch 2 does, which makes patch 1 a hard
  prerequisite rather than a standalone bug fix.

- No functional changes; both patches are identical to v1.

[1] https://lore.kernel.org/netdev/cover.1790751008.git.shijianlin11@foxmail.com/

Jianlin Shi (2):
  dim: clear irq_moder on init failure
  virtio-net: unwind VQs when irq moderation init fails

 drivers/net/virtio_net.c | 2 +-
 lib/dim/net_dim.c        | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

Signed-off-by: Jianlin Shi <shijianlin11@foxmail.com>

-- 
2.43.0
