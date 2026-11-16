Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821095;
	b=MP+bDB6Xv7AuW+KYv4u+nmEHDVaKThkp3hcg7BrDEq9VWQa0D3caJjNC/hI36bgOXnY2
	 1sQ9FDOQWFJMxd7CzrUjO0yCfmAer99AouYTMk0Ucoo0keU4ZeUZVEpGdKZwv9R0hlkGt
	 34khuvm+Gjhyo9ZLo+XKBMtW7GjlVUFlfjglMBbSgjey3q8+qEQvYJemky0F1DAPsYYSy
	 eQlkxBgeLJy6oOr+5OCUIcwr5xbIegswQG4Nie66dcTPdxCgVX727qw80/eRBf8chlLM3
	 T2FJblHJYXZ8EYOG4OTNoi55EoD5TqmzWUzj2XoMypDtIrIowgi/LfYUxxhf1pf4WBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PsdqLnUGdpIVrBYmye0zPsfH3hdWVwuux/Bo2cpeGrA=;
	b=EFngeLUd6Vp8v/NN8sCybRLN3CMnQv4YZnWHjJ311VeTplhcqVGDdfxNkHncuOOsAk5t
	 AulAIAOlQ22RUbI9c/uqBYlIApup6o7uwagk+ixuLOB+3cC49ZCXJNOPBSQqzAD9o6XdF
	 HztRtFRCku85PYoW47pEyow2KSlgrnhtv1Hm2GkC9DjBfTAMwTh6+PTtni4kZQB7pp//f
	 T7cLW+oyLkbethuaxII1lloKGWdxV5bGux0x7GPuBzNVLQaX5hfEgkgUU9+BQr49vRy0n
	 M8j3j0qOx+dKGGWFV4fB8fye1WgkkYg1dGhA+SmIlo+ibepuGZbG33RkscSISN8uh4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=is.s.u-tokyo.ac.jp;
	spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp;
	dkim=pass header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=J4oqTYKd;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D171606A881
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 09:24:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D171606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=J4oqTYKd
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33fb4680717so8737054eec.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 01:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=is.s.u-tokyo.ac.jp; s=google; t=1794821094; x=1795425894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PsdqLnUGdpIVrBYmye0zPsfH3hdWVwuux/Bo2cpeGrA=;
        b=J4oqTYKdhkb0jNaCJCwXA3+IdJxpD7u8orV+nMya3DxvW+VNn+8CfZ3PExRxLK/gvy
         ezpixVoX696YZTMc0YSOcD1crF10jmUMjPBtamELEHi2dXI/Q0V4EADXXBC2sYsKH9Go
         JwYubWJGJLwo+ebzrjNblarpHGiaDId4wiVIxT52yLCfi3P2iIvP+KodmYypN+wbeBSX
         Wv6GkIU9ZuUzd5JjznapSKUWqq/GoDuREl7M3NbSnel1xdGUZj5l8q5S/TloDa4km818
         aAxfM3bH5dLv63alpABlU5sxYgPWoJqnEAgvZT6PPOYRtD0hNdoZHHFyJJyMlZDs/TUy
         nmsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821094; x=1795425894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PsdqLnUGdpIVrBYmye0zPsfH3hdWVwuux/Bo2cpeGrA=;
        b=OCcJsqDoVTThqd2I9NicfjUB314XxcMlQIOWUMIRNfVljgf1cMKJDEaGcfjGc3hlWQ
         FB8/kdR0XhwdOrbZIBb/Bn+m+/NzgXmpTPRBRZF5sNVYIpod/RnURjhWrHVnvmRuqtNL
         iJCEapGOWOehg+UBVh+QE1IqfASnZ9ZzKz01p53S7CH8faHicDwfSC25ERTHRf+vDLcb
         BnNei8nlaLM1y9ED+tjN+wu4RA/abC2ARGcJe4m+yEes7PRy1RZZnrfVrwkU4yJdpHw6
         n/1iscaCPHcV9Vq2fmdbuFCDnkC9Z6XYysmPha+p129AB7yWUY+xS+pf5ehSBhxl7KMP
         kjzw==
X-Forwarded-Encrypted: i=1; AL+hErFgBYz+JhWJwsOkjrvrexewUMojHNasgkuSqeQWklvy2q4KCGVMj9pwCkHjxvPOpFcHHM50cDM=@vger.kernel.org
X-Gm-Message-State: APuU4Z88rBoDQhljQRdrrMKPr7P8gC++rqUa3JklbWNbzT320+puiz8u
	QVAQqF+Wr504HRmp0oAOr5uZLmwAoU1aMF8flBZSK23x99Jgxrew6e/QMjnsTSQqXg==
X-Gm-Gg: AZFdTZdqxaU7xj4aOD5C6IU3NN3BiHkd/6r/tXd00d5E/VIX8Ls3ya4j/PIhf8KUdFV
	eh2Jm9mY3W1vw93IYYP22tgrntO+Va8MEHleVtfVdwAJuIoxPNBj7zbAC2ZpaT8ni/FBHLxw87M
	LlJ04CBnHxkyycqp1Q2LUI4B6twXRwVUh8kxpCyF+myrno0GEEdTmmqiW8ACDqfwM4wysilVW7w
	FtaPc0I8ScgBCI2y8lE+iinZySedDxKv1wAVASjXWfcSdT28qPmZNlUmAa2b9vUB+M5msK3eE3t
	caXpMKBfkGjnLOJXoGR4BYlgoTftLY8XJT1HfFK20tqHuyFD3NpPs3sbyDz89aHIEgybARC/sXT
	TKa+7GG26L1473eo3EFZbzQr/DWwQdYzVCt8pgNKWt+vrZnBnPK7C97eEVb8lWlkMfBrkUjZYOI
	xF1GEcDRTU9zWANbPJf/OMcfIPZvoFYEJy5amJOVP2t8L0ohlzF5S4WdCm9SL+SeBH2F4sw4ZWR
	pxTsfMw5I7Uwr1/i/+cndKMyAkRNYFlLI3TiId5Y5I0oYDzOhuooiQNtDapRY7Nf+8Y9c9Zpii9
	iMWALRtioYXrCv4WVW21ywv2UyK8j+t8ErsUCQ==
X-Received: by 2002:a05:7301:4889:b0:36c:3b8a:8089 with SMTP id 5a478bee46e88-37967ddd89cmr10058508eec.36.1794821094425;
        Mon, 16 Nov 2026 01:24:54 -0800 (PST)
Received: from wang0.localdomain ([133.11.33.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad6casm32056314eec.26.2026.11.16.01.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:24:54 -0800 (PST)
From: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	netdev@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Bommarito <michael.bommarito@gmail.com>,
	Takahiro Shinagawa <shina@is.s.u-tokyo.ac.jp>,
	stable@vger.kernel.org
Subject: [PATCH net v3 2/4] virtio_net: zero the stats reply buffer
Date: Mon, 16 Nov 2026 18:24:43 +0900
Message-ID: <20261116092445.3391334-3-lian@is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116092445.3391334-1-lian@is.s.u-tokyo.ac.jp>
References: <20261116092445.3391334-1-lian@is.s.u-tokyo.ac.jp>
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

virtnet_get_hw_stats() allocates the reply buffer of the device
statistics command with kmalloc(), and __virtnet_get_hw_stats() parses
the whole buffer. When the device writes less than the buffer holds,
stale heap bytes are reported as counters through ethtool -S and the
per-queue netlink statistics.

Allocate the buffer with kzalloc(), so that the counters the device
didn't write are zeroed. An unwritten record header then has size 0, so
reject it when walking on that header to avoid an infinite loop.

The used length cannot replace the zeroing here, since the device can
also report a larger value than it wrote.

Claude Opus 5.5 was used to audit the driver and draft this patch. To
reproduce, the virtio-net device in QEMU was modified to offer device
statistics and to leave the counters of a receive record unwritten. On
an unmodified kernel, ethtool -S reported kernel pointers as rx0
counters. With this patch, the counters are zeroed, and a reply with
missing records or a record of size 0 is rejected. The
drivers/net/stats.py selftest passes when the device answers with
well-formed records.

Reported-by: Michael Bommarito <michael.bommarito@gmail.com>
Link: https://lore.kernel.org/all/20260711150754.2918392-1-michael.bommarito@gmail.com/
Reported-by: Jakub Kicinski <kuba@kernel.org>
Link: https://lore.kernel.org/all/20261110001659.1654289-2-kuba@kernel.org/
Fixes: 941168f8b40e ("virtio_net: support device stats")
Cc: stable@vger.kernel.org
Signed-off-by: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
---
v3:
- New patch.

 drivers/net/virtio_net.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 57d7a98ecb57..498014773242 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -4994,6 +4994,9 @@ static int __virtnet_get_hw_stats(struct virtnet_info *vi,
 
 	for (p = reply; p - reply < res_size; p += le16_to_cpu(hdr->size)) {
 		hdr = p;
+		if (!hdr->size)
+			return -EINVAL;
+
 		qid = le16_to_cpu(hdr->vq_index);
 		/* The vqs of the queue pairs beyond curr_queue_pairs lie
 		 * between last_vq and the control vq.
@@ -5068,7 +5071,7 @@ static int virtnet_get_hw_stats(struct virtnet_info *vi,
 	if (!req)
 		return -ENOMEM;
 
-	reply = kmalloc(res_size, GFP_KERNEL);
+	reply = kzalloc(res_size, GFP_KERNEL);
 	if (!reply) {
 		kfree(req);
 		return -ENOMEM;
-- 
2.56.1

