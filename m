Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795338383;
	b=KFa7BZWqNHtd7vGnWXShvuU7nO9XJivbdoupDI7I+lraCOBwIr58lMFqAbQk6omAN5vh
	 wRbxtsZaYO2aFZl7WPv59ZoGWSz9ocBrzvXg9+D8EhjXzkmUn2mFGy+1MTcU+8Qnl3tl4
	 nv5agxrkal+nxrSabQkadOvJHeDpKnhxCY0aq/HhKfAj0uxSiJKtlJAWFrvYNnJFRoNUy
	 Bog7FAiD/5BeLFmIuvYuqw6cZw7m6oTyezkzRogSLylpnKVaJ2mon0y/fRJ4HO0eTp7it
	 GNE1w2HqB2IcqHtgwel89/J9OM5bREGxGZmR4H+TdTtm2djNX714mtvYjnbQwqWAeKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795338383;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uToEBNakPiIRGWCEM4Fd31SuMokF+JV8bYXvcnPQnek=;
	b=BnrvK29KygWjDDXCr/eXUBJaMyqqqRr4rbCMko0W9k14U+Y/W1h2IkpviEVLXkh2kPui
	 eLbmstU5aoSbZ7AqjlHUjtZpWbyHm6D5jV/PbS8zO2uAk9hf3hf089gN0yXr70kq129d0
	 Bn+GSQd5xbuE7uWFkMLFeqS2YXUzYdVrwFvvzVKyE2xLsnGlPqgQOFtfegQOpyG2IuxGB
	 T2g5W5BL8IqBegufPKPTFdDiVQlrUZujZv3cS0CW1Qzt2WUugfWTB8gUPzu6Dv0mepw69
	 4ayi4y6Crlg9zcjvlXrMoBI0DRhDmFtl1I9NvT5LMD+xtITRtlKf6jJBnHY6i6IeaFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=foxmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A535606A331
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 09:06:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A535606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-386a9c93b4eso297554eec.1
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 01:06:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795338383; x=1795943183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uToEBNakPiIRGWCEM4Fd31SuMokF+JV8bYXvcnPQnek=;
        b=CvolLcOGhlNaqmk5oBMOkKauLFnVflgtGwFKzEaH1ahVkRej+DdkyI92FX6SEXoyue
         TpE14WLN0dN4c0pSHJ8Boyzc7Mup1kb/0tl7tTxMDMJMzRY/b5y+vse9280B1tdQbKNi
         O0v8RCNKZZXKRRMRGwJhL+BE2HLc3LhEhGm+9nc2WPydpSK8zPv3DHKPd5x2Vy07u3Tr
         vZLetUCJbTifURJYX04cD5pAMlKK/ujqTdEVWwqW02zRXf8OpGLIHn1JwjlLRhmQgyHE
         jBZe7QKKuxwjvYzHnTAK5biSfhqB2UTtapC4A3r0+4s7dRQQqNsKfqCAfY5l0gjPcwdk
         43wQ==
X-Gm-Message-State: APuU4Z+CspKyRAen4qFwoA0IKLR2hQ7bbXro3PqPALVEWjnzVc74djtg
	LqhVvL7jG4QETtcYFOy+iU8c2mYx9gim+RaLpxie2kgpVMWQJiUPp7CNc+ioeLx3
X-Gm-Gg: AZFdTZdo5xBKzXGaF3Asaqg+btTe6lfPyVLs8Pm9wFsXXeIu9IbqHbjydCS530ubfE7
	mF7FErYMIq1A+pQvI351slFqRN9LJopzkYS+G7eLz6OvRN7ygwa0OSHhADiYFd7pJVDeDs0s/Yd
	IJt6vIg0EACqdMlpX2RX0Jw++bUVmNJd3YwaQ5JMuW5iFwfRzpeDk8h9Q+x/bB5fr0CCankq3Rv
	AZMSKN6ZBEiq4P98yoPXv+AeewE7xXHj9k6si/JTGrVwb8AuEDey0wRenIid1reaqfZK0ec1w8Q
	U8hdvEGaPFeakvBtEhcrYJiFG+A//qK69d7EKso2t2mUo2PGoluOPtIE0KkxySwa6LfcjC/YTkV
	xHJooIPaWYI3zj4o5KX11EyQ1xbw8dECbhP0enNx8vNehCOi70tg5Rg+LQg76aC6OlOQ6vzLCce
	6J4XzNjzNqrjl4YaoDkN/ceV96x5LDZEbMP7KAGw7ZO/bS56ghBWwDGLzBuhIvj0497i2ECvKL4
	uHaAJkO5/EdhEY5DQCv0nqMqnWDr7vEJGS/8RWxIlUdNAYhIrmS/L/g0vpDw/IGVRTfEFRIs4d9
	Krw7FtCAKSwI2oXSO2s//pgdmf+CNpBhfyW7404kpuZK+Q==
X-Received: by 2002:a05:701b:42d1:20b0:1af:d88f:fc51 with SMTP id a92af1059eb24-1b5568edb1dmr8798032c88.30.1795338382591;
        Sun, 22 Nov 2026 01:06:22 -0800 (PST)
Received: from localhost.localdomain ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b562a82b3fsm16839045c88.5.2026.11.22.01.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:06:21 -0800 (PST)
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
Subject: [PATCH net v3 2/2] virtio-net: unwind VQs when irq moderation init fails
Date: Sun, 22 Nov 2026 17:05:57 +0800
Message-ID: <20261122090557.19766-3-shijianlin11@foxmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122090557.19766-1-shijianlin11@foxmail.com>
References: <20261122090557.19766-1-shijianlin11@foxmail.com>
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

virtnet_probe() calls init_vqs() before virtnet_init_irq_moder().
When the irq moderation init fails, the error path does "goto
free", which only reaches free_netdev(): virtio_reset_device() and
virtnet_del_vqs() are skipped, leaking the virtqueues and their
DMA mappings.

Use the existing free_irq_moder label instead, as
virtnet_create_page_pools() already does on failure.  This is safe
only after net_dim_init_irq_moder() clears dev->irq_moder on its
own failure (previous patch); otherwise virtnet_free_irq_moder()
would net_dim_free_irq_moder() a dangling pointer, dereferencing
freed memory and freeing it a second time.

Fixes: dcb67f6a9ead6 ("virtio-net: support dim profile fine-tuning")
Signed-off-by: Jianlin Shi <shijianlin11@foxmail.com>
---
 drivers/net/virtio_net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 1cd64f9e12e7..c307d39e01d1 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -7051,7 +7051,7 @@ static int virtnet_probe(struct virtio_device *vdev)
 
 		err = virtnet_init_irq_moder(vi);
 		if (err)
-			goto free;
+			goto free_irq_moder;
 	}
 
 	/* Create page pools for receive queues.
-- 
2.43.0
