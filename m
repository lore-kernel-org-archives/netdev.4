Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821093;
	b=0ELNbcRmNN02IRhMaRvigQjkzPuMzVC72I8I7QM9C2nLmZb48gA4BDs8errTEcuegxWi
	 sphj4hotXJZpEwPuKtC+dMvR266geu2z5sJGvEJvLgIJw8NlVcpzMXUDN8W7Yq6UEujlb
	 Co0UqvxqQ7OA0bDSMGLRCTpcl3ZY6QhRL8hLH965QQbZlNBn9OmyScB89gVs2SqdINoM6
	 3SPWPAyNC0ZSd+WbI2ICPPi/LJWjno+oo3rM6OJoQ8MUxD4pAN8+TJkZEI/JSr6jyb64Q
	 WfHjC+lo9aVXoOWmqvRf2usIEhitOYiKhB3UpWGkeNQ2SeCeVywXDKx1dh8L1+6MFMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wWFReQCNmO0chmlv4z0vEYsw9XSwzNSVOiZAm6Q6bTo=;
	b=f1vDzs3FmFo7Eg1bEsgCWCciSzT2mZHL6Fs1eVYDg4W5mJPXJqhzHDRaFl0qSH0WY/KK
	 fXTcjXoVL3tIkQOwyq0Dsti2GjVnM95jFb7+x6+i5rY31Z8i7QEu4Lf7YlezG1yeAlSHe
	 hkeZdIyS9s5FWo4Fil/0k0MwryEhnwIOajp33wTWgGGj9MyUtvcucyw6fTM+T0BSQsoW6
	 PG4+Ul7FZVzHqcfsyUBCeWiZPEFIETzqK2voYLV1QDNYjZFiXhUmSkiepTwuSCkASU9xe
	 0vu2N25WNaxaapqWRolsDx3AHJD/aNhyQdOKOf8gt/Zzg3rHVVJfhHbmqVuG95/fCMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=is.s.u-tokyo.ac.jp;
	spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp;
	dkim=pass header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=d1xH0vwW;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF74E606A881
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 09:24:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF74E606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=d1xH0vwW
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-37071c0f42aso4716751eec.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 01:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=is.s.u-tokyo.ac.jp; s=google; t=1794821092; x=1795425892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wWFReQCNmO0chmlv4z0vEYsw9XSwzNSVOiZAm6Q6bTo=;
        b=d1xH0vwW72dNf8B6ts19L8aOBpw3sMMg2s+Kb7smIenN9JByd8YzcP3EJ7vvYMnaz/
         ZLlHedxVBOxcvOp/t8GiPAV5qKkppj9fYHBpCX8idlDNSURV/YgjTH9cSlLEyp0cD5Fg
         CO5vC4p2O2dOHzJ8ikYPitSKQp0PhAJgVhmNygodgIYvOxZKF+u97D71QiRCcR7RO70V
         Ze6QIgH0cbiwEpGR27t2F49pPAHbNFlu92fxRPDduJIyuv1H5lM+1RIqhbiVSeWuyMzr
         3iJ/NL6IiWEB9jrVbOANK4ySE91+bRk6TwP1H6uiv2u3mVuK1URa+Aa0nQeUK5J1DPyN
         kOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821092; x=1795425892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wWFReQCNmO0chmlv4z0vEYsw9XSwzNSVOiZAm6Q6bTo=;
        b=Rm8KmJLXHxq9rR/86PePbdvZOg1RI14lwXK/lpS4VeupBhYv1RDqDsZv4W9G2nyHXC
         EgKsr8fdsB69MWXpK8WZgT1u+pJDj1ojYEufjevSPr1Nb4tX0MEGIfSJoIKXxpsR3NQl
         UVWz2AUMZh3gYErSzyPAUaC3nDsxX5TANWR12bHWWhocH9if8eFx8LdVK/KJggygbP+W
         Ju5sW1ZViOW6sIUJC/Rmc/h+LY7PaCsvT0B3GLr5K6Qeq7VXIJSsXDH72Mz7sOXEuIS4
         ZnJJiW/gknwgJq6e/c0eDXjWIaLTkvDKIAi7vlo600S4A15xwmewTkTZisB/pCse0e9/
         Q/eA==
X-Forwarded-Encrypted: i=1; AL+hErFgMGXlOgmxjH8cXAd5nspkNsuXmEw3V1wkdUsk41qXnaXOPfjR3M6apMeWCzmDzm48pzJ35Io=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wVJqw807KuLvh1Y7Tp+ul/kNRJYfOjGrspuZHus2CvQYYPdMx
	gX+smgBYOBivehziHQYXEtEjGCO/+V18iv99wAvEtiFplE+hN+F4nR/yXeA50sdSfA==
X-Gm-Gg: AZFdTZcHXbcw7UQHDSL8y9/0+rRDUJk7JlJW7dSm+OQc6CGdz8PvvXTveL63tn2RsEQ
	MmVImUNd3DXPvLTdK9xQD47QyvveoWR730w9fEntC19Id4lG6zihyH2QptyhTg5vPtwCS8Yvc9g
	r/is8APPD4gpWB0Sw0ChTgTU5nv3I/tCnc+wF7QBLvHnTTTxjCE0z1N8yY1OkQOjQ/Ukm0PcZPF
	UV3yH+tv7WsG8wEJwCsiKrN6+M57UL1pC4Nd7fwohfN6YkKfSSUjpBmAjLqV+wYJYoXIzdZhplX
	LwyscE9tgeJh/VDHbaDNOaOhH9mvYewKgFsinH6cTQgSW6xwFEBXgee7sqyPx3u0L0mI6QFZQBc
	SU5NnDfr9uRPYa9C9H0LMgtdWPg1K23cViVYh4E/KAXTKkmylqIAACIZNBMS70NhhbJ05rHMMPB
	8thClIRjb3fhc3bAerdYw28YEx/ELS9Zxmpp9WzwvMQziB5jgX8xIRUabL9Vlauy+M/wExqB66n
	NC/xjnv8n4WKt8h1DFoLuScTMknGWMBU4WSjy/2OWvVnepxJ3KtqMCzf8SEh+s4AuPdR707K0Ve
	hkqQ6zPgDu5XCV/Z86MhEehh0oDwsbRmN/NOuw==
X-Received: by 2002:a05:7300:d40b:b0:376:b957:c08 with SMTP id 5a478bee46e88-37966c489d6mr10969239eec.9.1794821091716;
        Mon, 16 Nov 2026 01:24:51 -0800 (PST)
Received: from wang0.localdomain ([133.11.33.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad6casm32056314eec.26.2026.11.16.01.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:24:51 -0800 (PST)
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
Subject: [PATCH net v3 1/4] virtio_net: reject stats replies for queues outside the request
Date: Mon, 16 Nov 2026 18:24:42 +0900
Message-ID: <20261116092445.3391334-2-lian@is.s.u-tokyo.ac.jp>
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

__virtnet_get_hw_stats() passes the vq_index of each record in the
device's statistics reply to virtnet_fill_stats() without checking it.

For ethtool -S, virtnet_fill_stats() uses vq_index as an offset into the
output array, which the ethtool core sized for curr_queue_pairs. A
record with the vq_index of a higher queue can make the driver write
past the end of the array.

For the per-queue netlink stats, the queue type also comes from
vq_index. A receive record in reply to a request for a transmit queue
makes the driver fill the struct netdev_queue_stats_tx on the stack as
if it were a struct netdev_queue_stats_rx. If the device offers
VIRTIO_NET_STATS_TYPE_RX_SPEED, this writes one counter to the eight
bytes after the tx struct.

Fix this by rejecting the reply when the vq_index of a record lies
outside the range of queues in the request. The control vq is checked
separately, since the vqs of the queue pairs beyond curr_queue_pairs lie
between that range and the control vq.

Claude Opus 5.5 was used to audit the driver and draft this patch. To
reproduce, the virtio-net device in QEMU was modified to offer device
statistics and to answer the request of ethtool -S with a record for a
nonexistent receive queue. On an unmodified kernel, KASAN reports a
write past the ethtool -S output array:

  BUG: KASAN: vmalloc-out-of-bounds in virtnet_fill_stats+0x6c1/0xf20
  Write of size 8 at addr ffffc90000085140 by task ethtool_stats/158
  Call Trace:
   virtnet_fill_stats+0x6c1/0xf20
   virtnet_get_hw_stats+0x5d6/0x7c0
   virtnet_get_ethtool_stats+0x11b/0x920
   ethtool_get_stats+0x150/0x1f0
   dev_ethtool+0xaaa/0x1be0
  The buggy address belongs to a 1-page vmalloc region starting at 0xffffc90000085000 allocated at ethtool_get_stats+0x120/0x1f0

With this patch, the driver rejects the same reply. When ethtool -L
leaves queue pairs unused, the driver also rejects a record for the
first unused receive queue, while a well-formed reply fills the
statistics as before. The drivers/net/stats.py selftest passes when the
device answers with well-formed records.

Fixes: 941168f8b40e ("virtio_net: support device stats")
Fixes: d888f04c09bb ("virtio-net: support queue stat")
Cc: stable@vger.kernel.org
Signed-off-by: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
---
v3:
- No functional changes.
v2: https://lore.kernel.org/all/20261102205550.4148064-1-lian@is.s.u-tokyo.ac.jp/
- Add a comment and a sentence on why the control vq is checked apart
  from the range of the other queues.
- Add the KASAN report and a test with unused queue pairs.
v1: https://lore.kernel.org/all/20261022182710.2055771-1-karin0.zst@gmail.com/

 drivers/net/virtio_net.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index ed20e76fbc4c..57d7a98ecb57 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -4973,7 +4973,8 @@ static void virtnet_fill_stats(struct virtnet_info *vi, u32 qid,
 static int __virtnet_get_hw_stats(struct virtnet_info *vi,
 				  struct virtnet_stats_ctx *ctx,
 				  struct virtio_net_ctrl_queue_stats *req,
-				  int req_size, void *reply, int res_size)
+				  int req_size, void *reply, int res_size,
+				  int first_vq, int last_vq, bool enable_cvq)
 {
 	struct virtio_net_stats_reply_hdr *hdr;
 	struct scatterlist sgs_in, sgs_out;
@@ -4994,6 +4995,13 @@ static int __virtnet_get_hw_stats(struct virtnet_info *vi,
 	for (p = reply; p - reply < res_size; p += le16_to_cpu(hdr->size)) {
 		hdr = p;
 		qid = le16_to_cpu(hdr->vq_index);
+		/* The vqs of the queue pairs beyond curr_queue_pairs lie
+		 * between last_vq and the control vq.
+		 */
+		if ((qid < first_vq || qid > last_vq) &&
+		    !(enable_cvq && qid == vi->max_queue_pairs * 2))
+			return -EINVAL;
+
 		virtnet_fill_stats(vi, qid, ctx, p, false, hdr->type);
 	}
 
@@ -5073,7 +5081,8 @@ static int virtnet_get_hw_stats(struct virtnet_info *vi,
 	if (enable_cvq)
 		virtnet_make_stat_req(vi, ctx, req, vi->max_queue_pairs * 2, &j);
 
-	ok = __virtnet_get_hw_stats(vi, ctx, req, sizeof(*req) * j, reply, res_size);
+	ok = __virtnet_get_hw_stats(vi, ctx, req, sizeof(*req) * j, reply,
+				    res_size, first_vq, last_vq, enable_cvq);
 
 	kfree(req);
 	kfree(reply);
-- 
2.56.1

