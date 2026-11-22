Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795347448;
	b=ceLHXGAfy2C0gqxZlBFLmP+DJJUXlVUPUTAxroT25K7GuK3z0+09Vnq9lVnnEkYmQj4Y
	 NRaz6vZEV8cqC8IaByqXRSinyPzqKYLyMg5RjEWda9sJZUNejRrK41KTDXbPMtG0voN7q
	 rw8Gl7b3eVCGiWJmjYzbzdDVEwI0q9CsWczAVA/o35z8WD9GXEFL1bwp7mHkMUEmSjfsT
	 udgaXlPdxdHRN4As6E9brOWL+wQRIHCVP3u4UbCu4R85hNFqbSJJd/WP4k4htADSo43pQ
	 2DzJV7w6OyHED6AiWNd0mUjjIEj3SgC8N5gKr/i1XTT7ULHwRE8Fw0hcBTa0OZa4vrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795347448;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Gn+/1uCQ6mxawzpB0lRomnzHhX1NF/CsbSiAljPSAiA=;
	b=n9MM0Wca9+IFuRy7ErQcBnnZ0WZv+iFA6qPazKczO6i+gieg8Jnqx2n8xCUHH7UsW/K4
	 coPuTOUYhdwzUWYQW9F/Lu54ObVS/gZ0OPPnBP2WgKFI3FxNMRjMPmntevok+DaRxjuJa
	 0gd144nDv2e6HZRkHFcYJ7Y2uJ3g4fMpvUGSYiPMx+44K4AYtyMQdw/zXTeg3NQy+N7CO
	 WSHNwg6QxSdoZzUNxDvIITjCCRp8IOc+XdYg9bmP5Fh87Sop3bGljw1Ythae3lylgUu+F
	 6Qy/YRPdEn2mv3e00cacsZlJkjtKRB37wcezB9KPpyLKiH1bzDYi3H6JMdWpd16653Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=foxmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.227.128
Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FBF606A32C
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 11:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2FBF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj2-f0.google.com with SMTP id d9443c01a7336-2ed216ed287so14244035ad.1
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 03:37:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795347446; x=1795952246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gn+/1uCQ6mxawzpB0lRomnzHhX1NF/CsbSiAljPSAiA=;
        b=YteEZWUaCXuUAMcSAvoC2mqWB2PMiocCi6guig9qk+OYSAMSOnAk7NaVJ0yHveOhNh
         dGA1QzNl1RUAiykt/yI+43EiDrKu0f42mK8ZrqxtxkRI4feuE5kt/BaIOGyXBRJc4KRg
         GuoDuPbrjTBny9HYzRe7VLgqkfXZ09XL4nMITQUioe0W+hzTosmxDUBB+kk0o7xopoy/
         yBENrR/I73pSN5Cg4wbd9tYEZs1qSEJrHaWpxfIO2vktzVmARhmTtYKno9VXGh4ib5B8
         6POnCX4w27UoVAIUTwYGbg/Vqfv29CRxV+zn8rk5/xj1pfWuYNeDXRCS1DpLO5fKVrS8
         tHCw==
X-Gm-Message-State: APuU4Z/k9Vy0n0GDnIQVaWXPShx/vweiN10BYAhQFmP+seq2GwzOXxr+
	PTDJA3gVpCbBxud/vsaIOonK6o9tTBaQowsYyFt8KgWABcSd+QgWlHy1
X-Gm-Gg: AZFdTZdfLK2Dxy0H5CiSkHXPmCS37avSNTiX9QO3MaNYdqSETBW93GnfYis1mUePsfQ
	t1uPRijDvfcXrByNCZf5piBXLDiZTUVbEbChNYOj+xuzVdW9JIOpX/zL9sMc6MXkFmoXKfdbPUf
	tjqbWzj3ZTbtQAnf347jaY6NAsoZtKSOpqtTEjzblk0IBHGVQhOej0HBEG4IzyczK/5pm3XRRoo
	JUiWcdTZwZKQE0Q4C+Xo9NWH+E/7XkUR/Lo3xz9nwFP1WxKUs4G4Tt/H68ZYqHHrUiUpuD+5S5L
	NOyhBNS8TFTI07CfX4ozB6PPTFnXG8BcNPQFYpZ3sTb/5eOT3L1/Z4w6bkNjC7Blkel8KqkrB6E
	Z4ZQO4ew1JJO1f+s39RT8u7oBVbZE5aeI4Y0vpT3LAoYwEUpdgp0oKQ80B6nxjpk+HkuLP0Mvg0
	QiCNm/jtb+BiVYThXDApAhaTfs0W673QdvsR4INscKQIRrQew045lTLbnntPTYBR2GnAw2Lo/Zz
	Or4wmR/HQ54kYzn7fmTNKL22n/y7unEXB4Ve/O8mDZGbEFgtAwPenkt5NjpKa1BNzmU62s6Zn10
	7HEiVw8/+3X7uzQeJ0izDVWzzrCcnLgnsr/JPpcj4Jo7wg==
X-Received: by 2002:a17:903:2b0f:b0:2ed:edf:4e7b with SMTP id d9443c01a7336-2f03f249c51mr86538085ad.38.1795347446143;
        Sun, 22 Nov 2026 03:37:26 -0800 (PST)
Received: from localhost.localdomain ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f10c9casm36633105ad.52.2026.11.22.03.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 03:37:25 -0800 (PST)
From: Jianlin Shi <shijianlin11@foxmail.com>
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org,
	mst@redhat.com,
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
Subject: Re: [PATCH net v3 0/2] virtio-net/dim: fix irq moderation init failure unwind
Date: Sun, 22 Nov 2026 19:37:02 +0800
Message-ID: <20261122113703.30415-1-shijianlin11@foxmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179533878871.3294.14009692721054097098@kernel.org>
References: <179533878871.3294.14009692721054097098@kernel.org>
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

I noticed this while working through the virtio-net probe error
paths. It was not a production incident and not a syzbot report.
I did not hit the allocation failure at runtime, so there is no
stack trace.

virtnet_probe() calls init_vqs() and then virtnet_init_irq_moder().
If kmemdup() fails there, the error path does "goto free" and skips
virtio_reset_device() and virtnet_del_vqs(), so the virtqueues and
their DMA mappings leak. That only happens on ENOMEM during probe.

The dangling dev->irq_moder is not used on current mainline. That
failure path never calls net_dim_free_irq_moder(). Patch 1 is only
there so the unwind in patch 2 does not use-after-free the object.

Jianlin
