Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794742965;
	b=pbO2YqzFOLVHpUjtNlWXbMQwHXHTKuP/mFjmHl1wLhrGbdRB2jzQqcLFy19TTigcVmIw
	 RzkI+nc5GThTVimIB+BUKJIGqavtO9dG/Fs/kaqQpD9hKrSh39/VTv93I3BvfhZDOOqvY
	 E6ym1i1qq/RF7eDC6UwWKykPflfXQfmdA36Zxhxc3HXYw5lT+02dRSzsX0TOIUmY6zSlo
	 bzn+A50Q3H+g7wuXLcdRaGt3y3d/1sjCzuDTunXF8Zc2+uuAlwJgrHhchQHQfxMkP9859
	 sthMXzZBaRRNYo6A4qdUvDLi7Pldi8dpuRZxWa0FaUif+xVxHPEzFcemtusjXNbUm5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794742965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=IvIEFoX9Gp+Y7CbxFyyYFIIDn8ikvGnI11j3avLfflQ=;
	b=ppUXhotLqH/Pf3cSSKtXbYgr2F3RaeHt/w3gmNu/AN6ax6pIwzQ0t1D0djH2fVV+S84E
	 eewfwEvB32aytr2+yJgvx7OKsdEWc70yapLPFhz7FbzTOwqpm5jYH/Xt35WZPgDyQ0Ila
	 bMVU64JAdMrxOfAsDwZ7PjvLHSyH5JkTK8W5J901amdARxuiInDB/Mdc3CPQknaqac1Ep
	 Au33V6sfgyTD6IvH7KXPqnW59Hueswiy0QynSViI0NSO4Qr35plmAJnpf7UCzWzbjkD0p
	 5t33cwc48JVokuewIcc5rMXAgWEN56t7dFeSmA3nftUOQOtyhVjqkHTKXvGRrrqYd3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F4zFlkDu;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2D9606A31A
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 11:42:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F2D9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F4zFlkDu
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso13321175e9.1
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 03:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794742964; x=1795347764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IvIEFoX9Gp+Y7CbxFyyYFIIDn8ikvGnI11j3avLfflQ=;
        b=F4zFlkDu03Tccb+UY9MZouBAmFkH0LxqYlmxL2W2TWh40xdiRimMbIR03thI5yK+U4
         kl2l4YVRbN3p0CDUlMdsdxQi8fafLwqRTeRWn8wDgzY+qsiL4ktFYOPJc0+LiMVmcITt
         64JT+sgb7tCFx1JDNEQr4N8s2BFZDJbpFv+XnCtqekl7s5/aL8GtlzEUJjPo7rDCGx2H
         91zdFs+MiUxFJiEYFul2Ktx9AsHWavLgj/PstK7BDL4uV2xGjUvWA0lf/u21llxi7YXd
         MsTComYkHpSEpzgiSWnP/Zu3S0L4XpxAyyp8EC22BzSdhEbougC87+nyTip9YiYsAKFE
         FVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794742964; x=1795347764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IvIEFoX9Gp+Y7CbxFyyYFIIDn8ikvGnI11j3avLfflQ=;
        b=ZTzb7iZSYVxw8teOZw/bHc8s2l02DuBm8a0i0D2X6TWoOaLR+PYwwPpt/RrI2J6Z0g
         aRPt5gh95hVRin8uaYnTyHPMwGko+7/dpdxW+jp8wiIuaElwEevgmArrXZThR/pVtyJb
         UGfN3gJ1AlOnRc5+5GnxSCfuwsqZcSu/J/1tdeQeiXfYRCFfv473jwnV9P5h0a5wor/E
         jZwv2cRtPU79VtT2tgMAD+o0kmrERQUc++2JBY77IEhcfuGdsXgC0BOb3d+ZW4tqcP8p
         vjSI9ZKT8pF9jPbhXgtmkEuZfcBHYN4iwv+rBVuV0y0CqBsqtdeB0o+Bm2XluR4Ow+Fk
         TT/A==
X-Gm-Message-State: APuU4Z/+GqMD3SkHkCTRR2xQzAgwH/No5d+oIbTnqbpKwkq2EvAPcd5k
	HdtE9ACZ5xQjVD10xgGmB+XpNaoVQBcHR0P/hxDab9CXyOy2jgUQPi2UucoqZQ==
X-Gm-Gg: AYBFou1BU71t0JSb4OUrQXotwX1GmRSUZzM86BsD7K+2OZDld1kMA/b0tV5+PSRQ96b
	T9Af0sQoN+n21kfdw6pA6Dycrq08fskWaJfAEKTBWPuuiVFpcM1k8YHjmsdU/0VvMHKb90ll7vM
	a0HbFBz4Nuyu6pOpWGMX7TbzRR4wpSA0iRRuN9EYz65QTbAhZASewl+t5ZEFXkzuiSkUie4ib24
	gHyR6l+O1Mw3dkTjhRr9QRGyZrENwhFU0wOIUXS3PUUBnUu+0IaTWR4m5lLzpZ8sphZpE+hQRbk
	fHFKvFeBH0DYEgLfdrJAaEWCu1wzgu3GFxxs+RQIkeQAxzvoXQ0/6ontJOWfDRcAPnKPhNhFhJP
	7Vy1yz4PwY880DIp1MJnYkZfQSeb5/+bOJVCQt1yJ3Fh6LO1LVV4Cy7cn5JovHjp8WOWjfQvsxB
	m2lUCRjBRdJUQQ1ITmvZgyzcslLqQkK4njA3ONqbgFuJQwqIfO9aLUEDp46pW7R9T86TsVU1gll
	tBPtLHh1E8TgTbbkZN9BT9qZU3DXwcGPTUuFOzTtBwl1BT0d3R6zRocuncduJpZJIPPjVnRyQa9
	OJkPhaaB/FuWZ7xdoIQ7sJx5HwbN3xfax/N44RXf/0Nu09vAYQd+9linA1Hb7fIWE3c=
X-Received: by 2002:a05:600c:524a:b0:4bb:6cef:d14b with SMTP id 5b1f17b1804b1-4bb6cefd40dmr20629275e9.2.1794742963680;
        Sun, 15 Nov 2026 03:42:43 -0800 (PST)
Received: from localhost.localdomain ([2a06:c701:474b:1700:da41:1869:5f63:edb1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e29daa5sm314858475e9.12.2026.11.15.03.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 03:42:43 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: netdev@vger.kernel.org
Cc: akiyano@amazon.com,
	darinzon@amazon.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	atrwajee@amazon.com
Subject: [PATCH net v2 RESEND] net: ena: set admin device pointer before queue allocations
Date: Sun, 15 Nov 2026 13:42:40 +0200
Message-ID: <20261115114239.2308017-2-thnkslprpt@gmail.com>
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

From: Wajeeh Atrash <atrwajee@amazon.com>

On the first probe, ena_com_admin_init() allocates the completion
contexts and admin SQ/CQ buffers before setting admin_queue->ena_dev.
Their allocation failure paths log through this pointer, which is
still NULL. A failed allocation therefore dereferences NULL instead
of returning -ENOMEM.

Set admin_queue->ena_dev before the first allocation so the helpers
can log errors and return -ENOMEM normally.

This issue has already been fixed in Amazon's standalone ENA driver
(commit 7d1dc4341d4f).

Fixes: da580ca8de2c ("net: ena: add device distinct log prefix to files")
Signed-off-by: Wajeeh Atrash <atrwajee@amazon.com>
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 drivers/net/ethernet/amazon/ena/ena_com.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/amazon/ena/ena_com.c b/drivers/net/ethernet/amazon/ena/ena_com.c
index 297fb36ab8c16..9b14cddf4432e 100644
--- a/drivers/net/ethernet/amazon/ena/ena_com.c
+++ b/drivers/net/ethernet/amazon/ena/ena_com.c
@@ -1992,6 +1992,7 @@ int ena_com_admin_init(struct ena_com_dev *ena_dev,
 
 	admin_queue->q_depth = ENA_ADMIN_QUEUE_DEPTH;
 
+	admin_queue->ena_dev = ena_dev;
 	admin_queue->q_dmadev = ena_dev->dmadev;
 	admin_queue->polling = false;
 	admin_queue->curr_cmd_id = 0;
@@ -2045,7 +2046,6 @@ int ena_com_admin_init(struct ena_com_dev *ena_dev,
 	if (ret)
 		goto error;
 
-	admin_queue->ena_dev = ena_dev;
 	admin_queue->running_state = true;
 
 	return 0;
-- 
2.43.0

