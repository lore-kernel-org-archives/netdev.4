Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593196;
	b=zRhpppuvtTW0qwER6lvBP5DMK2firwFUDqSQs1iuhLQ1ZXqG5jgBe9RRA2o6K/i7lrhY
	 r9flmSglqYrvu40ztcVuylP+JobS5i5OH+4ayIYwcPqRduJdqLdwwI/kOzHtrdUBQ30Zm
	 QI3U/yCS8YIs2Dz0AdsuPgLsNvy3wTYl15o5J0zoRT/4hem3fhwgvGGGiwlOJIKWDdZ5q
	 QFIoQfQCGioy7pcK1z5TdmVNuIi5E3vhwscZrWOkpocVY/tFAhLfkxO9BZZ3LWprLco91
	 zVmjQfBrOkZF4v16K9/jf8izCpZVocNhz3HJHByOVgmHTOgQsPkKbGlekFjfnlnMLpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Q1IQ8dR9rtLk1ZtkiFmjTbNWLoeDxqEYrwfomHq3uus=;
	b=EMTf78L0Aqh2TRTP3dmnerGPQb0bnhcJaGza4hGmtrCJhDcRVz3f+P2mDTfByHC3GrE6
	 WzMeMaKN5AEzxcI2erAGXZW1XS5h87rHlnIw6KIRwJ8D0bRr24HlBsV84KUaqvzuL8Tck
	 kSAUj18YyESJehCfW8xIB3lPz4OBeLY3o0Z9jXhtg0NodAR6mtKT6NyOQKmxvliYRysCi
	 Fd2ovnQiFvVh7scPavOSpm1Ayx5U2MBWZMx36CBQZXjRaRpdNVkxl+cObo5fUkH2Buxp5
	 UMh0hhpf7AsN6xm6FZuC+atn/lqA9UJbsLQH5COnJCxTlBLQ4jcljN/pqH3wlf37MpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aQ7slzrm;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0256606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 07:53:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0256606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aQ7slzrm
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso38575045e9.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 23:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795593194; x=1796197994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q1IQ8dR9rtLk1ZtkiFmjTbNWLoeDxqEYrwfomHq3uus=;
        b=aQ7slzrmMgaVPl8aVrgz2der8OplBkcNJfyrDRWxBHbvyGh7rnDwZHkQxnXqw+4hOa
         Y2ZZPEb3+cfR5h0L+etqDB00UeFouGwsPzKJPxbZojc/HGtsCsUC6ebTZI6s0FOQ/HwH
         YGu84sKCL4ub9CvUgrrjr5jn5IthDMMTfB1nPOv/r0HD+lHCa9U9n1asxbl4opWJXgYg
         YFsKJth1YyFpi8RFFgLppP9QwVrIDc0fTbYmwsAaxPXu0MaMgVbrk9G3xPSPKTzuHn9Z
         wrr7kvhZx+a2RJ1/covHQMmI81/yyGdyzlez4uZ7rUptOET08o6swyAgFyd9Yp/4U/pq
         DqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593194; x=1796197994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q1IQ8dR9rtLk1ZtkiFmjTbNWLoeDxqEYrwfomHq3uus=;
        b=huZabPNvytB8k08dUokwzJLjzRSTjWDhHpx1If+0hhGASXUfm2px2H7CRhveQdb50L
         2EGNNvkgrzGKWNPUyOTH4QxPrYVeQ89GVNaxO0t1oSlkvqTiImyGaP0oeRJj71mIxGlg
         60Xx5R6iLAQbpQgYoAR42jp2jmVsvFq05kxKFMsti8X9QToZvfKJtE9o9CNUNxlSAr2H
         4vpbMt9cWNSrQAHkW56FPOKm0fqr4LMxg9JXzOXlVBOMmBCuXkKUEX9JOqZjyjZKdHLc
         8qlgev+eL4oL5Cl8LmhAxKp2y/XcqkYXLP2q3aobwJopUo6Pjs0WVW65gr+QicZ2lolI
         4nrQ==
X-Gm-Message-State: APuU4Z+2af0aLyVWCK/5Au/gw35MjnfLX+O/WVIEOE4LCv4//imaFCyH
	JDpofzCJTBmqDlUDoMQBtb6Qtj2lPeR9JuD8HNH/QDRmGWPZanQAop9r
X-Gm-Gg: AZFdTZdIjs4DLoMSj3EEulSqs0d029/7oB1OaiGpkOs3l7vc7bWghppNYff+Do6FIct
	pHiJcWaK/txr/izyKtAHF4AYqXXpoC9in3APaQXbxZ8EJ+auTQohK5fwzMEZyPLJzM3gvjB7/Rm
	TsCFxe3q5ju8gkHHMRBpNZ9LuqvEyjsGXNSTyU1yx/Aeuw8FmIz9OX14jXPg0oSIWexlrpIZ3o6
	t7630jVbz2TQDAiUbzp7HbpfwocvN+ae43lvQaoYlxcPIjg3iE6PrZgJHPYdJ5LRKCEjKOQj5QV
	aar4wmKASfmzerzJTM6sQR+aMWA3m5as5w0Bb3ORBcz9+LqJ7FHn8EZAbLiQMrXgAg7fwbm8vrk
	IxC78cLEG7MF5nKD9Apy5jrzhXWsiQp1HY9ejkMasdJ2EnRqMQu1o6qHbUXIx6m9bADqp+Ozwpa
	0U4r4EU1/xsyDa/puwaYS2UtNEPXQbBydnOH2Wnt5/ADkV4+AcXqGQKtRBD5FJTFKR0oQ7x9S1w
	pfz8z5VlCPcAsTC56opiSXQ2dXEeQFBxuooPkQoq5QzNDCa01XCcbgELlhqoOCk1xDhABKpKMvY
	5VtO4uOFSpWmYEruhmwSeMSjRMsza2WnaJ1tUNw=
X-Received: by 2002:a05:600c:3547:b0:4a2:a6e:80f5 with SMTP id 5b1f17b1804b1-4bb888098bfmr344058795e9.11.1795593194321;
        Tue, 24 Nov 2026 23:53:14 -0800 (PST)
Received: from Philipp-PC ([91.227.186.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a680483sm33001138f8f.28.2026.11.24.23.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:53:14 -0800 (PST)
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
Subject: [PATCH net v3 3/5] vmxnet3: limit the XDP MTU to the rx head buffer size
Date: Wed, 25 Nov 2026 10:52:53 +0300
Message-ID: <20261125075255.1517-4-filzador@gmail.com>
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

With XDP, rx ring 0 head buffers are page_pool pages, but the length
given to the device is skb_buf_size, which vmxnet3_adjust_rx_ring_size()
caps at VMXNET3_MAX_SKB_BUF_SIZE (3072). VMXNET3_XDP_MAX_MTU only
accounts for the page size, about 3494 on x86_64 with 4K pages.

With an MTU between 3051 and VMXNET3_XDP_MAX_MTU, a full-sized frame
does not fit the head buffer and the device splits it over a head and
a body descriptor. Such completions take the skb path with a page in
rbi->skb, which crashes the guest; see the next patch for the details.

Cap VMXNET3_XDP_MAX_MTU at VMXNET3_MAX_SKB_BUF_SIZE -
VMXNET3_MAX_ETH_HDR_SIZE, so that up to that MTU skb_buf_size is
MTU + VMXNET3_MAX_ETH_HDR_SIZE and a frame of MTU plus Ethernet and
VLAN headers fits the head buffer.

The problem was found and analysed, and this patch drafted, with the
help of an AI coding assistant. It was reported by an automated review
of an earlier version of this series.

Fixes: 54f00cce1178 ("vmxnet3: Add XDP support.")
Signed-off-by: Philipp Sudakas <filzador@gmail.com>
---
 drivers/net/vmxnet3/vmxnet3_xdp.h | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/vmxnet3/vmxnet3_xdp.h b/drivers/net/vmxnet3/vmxnet3_xdp.h
index f9d843e..8b69af3 100644
--- a/drivers/net/vmxnet3/vmxnet3_xdp.h
+++ b/drivers/net/vmxnet3/vmxnet3_xdp.h
@@ -20,8 +20,14 @@
 #define VMXNET3_XDP_RX_OFFSET	VMXNET3_XDP_HEADROOM
 #define VMXNET3_XDP_MAX_FRSIZE	(PAGE_SIZE - VMXNET3_XDP_HEADROOM - \
 				 VMXNET3_XDP_RX_TAILROOM)
-#define VMXNET3_XDP_MAX_MTU	(VMXNET3_XDP_MAX_FRSIZE - ETH_HLEN - \
-				 2 * VLAN_HLEN - ETH_FCS_LEN)
+/* A frame must also fit the rx head buffer, at most
+ * VMXNET3_MAX_SKB_BUF_SIZE bytes (see vmxnet3_adjust_rx_ring_size()).
+ */
+#define VMXNET3_XDP_MAX_MTU	min_t(unsigned int, \
+				      VMXNET3_XDP_MAX_FRSIZE - ETH_HLEN - \
+				      2 * VLAN_HLEN - ETH_FCS_LEN, \
+				      VMXNET3_MAX_SKB_BUF_SIZE - \
+				      VMXNET3_MAX_ETH_HDR_SIZE)
 
 int vmxnet3_xdp(struct net_device *netdev, struct netdev_bpf *bpf);
 int vmxnet3_xdp_xmit(struct net_device *dev, int n, struct xdp_frame **frames,
-- 
2.47.3

