Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593191;
	b=JFlD39v4R8amSqCQU3Oot8dqkuGzO8xPz1wly3ORyQJTA1O0rtIiA4ANK6Ko38F6Eb5w
	 LjTIKAzXVGxuPf95MIzJcdcpTCzNcb9Z8V/3geJqkndk4iKBu/1KbnyNEHGcJnL4ZRIDe
	 3scqkiRWF46oMjf3CUWgabjUfsKpjTltrqkSKyYJntZnhfFHCYuxxUnuK12q7Lkbgk+wg
	 uiX2dx4BCd93L00eTm/P9VEBhe3bk/NQv9nIFBURvK+WGM57dn64BjrTEnTSdflnXy6ZP
	 zijTAWHPvUye9oWL3DJEQ8fo3Nh7+XPtbYUDwWELVHdD3EYjqT4NY+JVP2K6L07FtOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nAlv3xeWLjPkzwFkSmSMhDw5Up084r6SQ9sON5hrIy4=;
	b=D3nM5uxNMbephR60ogLBmkjNhMLBPVvkhkkZ4J5uEGtiEO2UynxcLeZMRgLzJxch86G3
	 sq2scaBUoyImbdRtuHKAnm0zeaZbVWtm71hap8o2Bxr/pI5COEIBw4jd9pUzj+LaDVKy6
	 AWm4ZgFZkulxf0tFQCaVtUFtWttm47/E2c/Kxnra0aXu1S6aL2cjfGS6QS0SDZjkcJZAe
	 U7IuAmQkNmpn3nRghn8G1p8vmKpVV7pGukWrXqnUbNrjyKQAZ83AYV+REQWUXPWRfp4b2
	 X4QUF4toh4FCBsfHOpg0KrAjec5owch9beb4Vu1LpO6tZKlwSJb6XOwhQWQK609gxSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o+3hBtZX;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E44D606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 07:53:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E44D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o+3hBtZX
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4ac08f4a0b2so3812162f8f.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 23:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795593189; x=1796197989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nAlv3xeWLjPkzwFkSmSMhDw5Up084r6SQ9sON5hrIy4=;
        b=o+3hBtZX2n152doDdurhNK7m8sZN61nzua1l3ObMLghmRbiSkFchusywbfY07OxyoF
         iiY5qjUE1Kkjwki21Oq7Mh4vCsTV2c1nacahE70HrosyyeeGokZCHzwTE8W/cduePNE4
         7jTXqXt8Q56n8fec78d1Y60DXD1ruyymcI0ejJ6kGKFBKL5n4q5Lz+pFz+oIevG4CzDa
         v6eAOugLiITw2eRP6d9dCnh+lsrnnCAT4ufDIZx+kBeGbw/vDU+OB49P6WXSjpyee4IF
         7fju9aio5VZ3CKC1KLGAieis6n0zFlyQ8P7SAg3bD3nNs1jmS/Q5w16Y/X/iOroG9c9E
         I7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593189; x=1796197989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nAlv3xeWLjPkzwFkSmSMhDw5Up084r6SQ9sON5hrIy4=;
        b=H7olODY3szDfwpDupdOsGS2BYe+9XkUgY3q0qYs+2uidX4bpdaSoc1BsyfRfKw9HKU
         7XvSuRROwFiYFh5Npd7uW9MxeyOEVIWdQIOHsTS56EzyQx+f9yjH0WEvfjRSb0zTuzFO
         SleFXJc0dqcjkfQOHaJ6bwxIK2UY4PcPGlslmvBJUpB5EdouYPtgwR8JXwMu15+6GmuJ
         xPWXwNhlZATbj1tc+V4Gq0wI7Ykv1K5jeQYst25EOjQNOf1btGdVZCq+CZ/mFIVWJdIo
         k1YARxWs+FCNlfkkDXYqTXXD773ORq5h2CWT0PyN46Y9A8ICjciKDuhEDBLzsYboXKXq
         63xA==
X-Gm-Message-State: APuU4Z+pvIAnWma4QT9SZDH0VTgq2IOclYBli+8j+Tse4xNFF4AoCUe2
	O1FbMkjAeue5iNVPCV4B0utBRypLpqKw1FkmqrS4X9ZzSMjbK/pk7YTW
X-Gm-Gg: AZFdTZfJOInQBicoHaRLjkNQSdCjO0UWLFs5J0yRtD0yEifad8hVDq8INeGxebFKLlp
	lS6YGiGXUBZ1Izi1qy5RY5sO9e+gHRcYp05meVzq79kLB0J19srBdotM9RsJyJW92Q4LfdDG9zp
	uPuuNBySNjZXf0bJzHLs889HiNPU76rshRPB1dZEHFaa2VPtK3wuWiFa4yV7i1SkizXOpS9fAHu
	Xa9smhYBcptl2oK0w5K9KKEamGspYD15vhH5qgxV5f8t56+OwwIXYPjd8bqmJuL4GxYasgZ3PqJ
	d50PtI0C3GpPuC8+Yxf5287UcPhN+aG+T9zz5Slsf0crxuOz4pbH/3ThqI/uRZCyp2CG/v6frEs
	4NJBkTx7SpcfFzkB8kTkkeMOXNbQyfl01MEqZXRQo9cTPQkPHNrd9EosjDs5Jm+1jVjBraIqPYu
	PGDoaprJE2IobwIV02HqBJgqzZLbckFxbAEFJTz9lS7iAaqACYa7lueJBna+o+WG1qyauKolOp5
	Bq1onCldWrIe91z335dFhhmTGmqelr4c6AIA8cV0jyiMhQtBggAQcnZVL9bGrfMPa42qzf8HxBb
	ETslCoKTXwDLNACIbcWBtSJRUeMa0fAITb7hQ9A7
X-Received: by 2002:a05:600c:820c:b0:4bb:7987:fbbc with SMTP id 5b1f17b1804b1-4bb887c29b4mr303248805e9.1.1795593188856;
        Tue, 24 Nov 2026 23:53:08 -0800 (PST)
Received: from Philipp-PC ([91.227.186.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a680483sm33001138f8f.28.2026.11.24.23.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:53:08 -0800 (PST)
From: Philipp Sudakas <filzador@gmail.com>
To: ronak.doshi@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com
Cc: netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	u9012063@gmail.com,
	Philipp Sudakas <filzador@gmail.com>
Subject: [PATCH net v3 1/5] vmxnet3: clear rx_ctx.skb after a data ring XDP verdict
Date: Wed, 25 Nov 2026 10:52:51 +0300
Message-ID: <20261125075255.1517-2-filzador@gmail.com>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <20261125075255.1517-1-filzador@gmail.com>
References: <20261125075255.1517-1-filzador@gmail.com>
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

For a completion from the rx data ring, vmxnet3_rq_rx_complete() sets
ctx->skb = rbi->skb in the sop block before running XDP on the data
ring copy. With XDP enabled, the ring 0 head buffer is
VMXNET3_RX_BUF_XDP and that union member holds a page_pool page, not
an skb. On XDP_PASS ctx->skb is replaced with the new skb, but on any
other verdict, XDP_DROP included, it keeps the page pointer.

The stale value then belongs to no frame. If the next completion is a
single descriptor with rcd->err set, vmxnet3_rx_error() passes it to
dev_kfree_skb_irq(). The ring buffer XDP path already clears ctx->skb
after a non-PASS verdict; do the same here.

The problem was found and analysed, and this patch drafted, with the
help of an AI coding assistant. It was reported by an automated
review of an earlier version of this series.

Fixes: 54f00cce1178 ("vmxnet3: Add XDP support.")
Signed-off-by: Philipp Sudakas <filzador@gmail.com>
---
 drivers/net/vmxnet3/vmxnet3_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/vmxnet3/vmxnet3_drv.c b/drivers/net/vmxnet3/vmxnet3_drv.c
index f8df83f..e8be95c 100644
--- a/drivers/net/vmxnet3/vmxnet3_drv.c
+++ b/drivers/net/vmxnet3/vmxnet3_drv.c
@@ -1742,6 +1742,7 @@ skip_xdp:
 					ctx->skb = skb_xdp_pass;
 					goto sop_done;
 				}
+				ctx->skb = NULL;
 				need_flush |= act == XDP_REDIRECT;
 
 				goto rcd_done;
-- 
2.47.3

