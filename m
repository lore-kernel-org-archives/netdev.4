Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821101;
	b=SrkyY7HXNpC8wNH+dF5I72b/9Z2RFzhN8/mYlBJChrnSL8YObYVMEJQh54WnLJES+a5s
	 UDXGdBUbWkg8epanTCkptZPaYHTkgxAAG0UzyzX5tF8Rca844g9b5QWG/IPFxnjuVNvdV
	 8PCmD0DxrXzko1vfANgVoe5cr1ISqizsm02GDJkjMPtbHp6gQvq69H0b9DZaFTY1OGxlr
	 r322CiLBLUVwhsxVAbjhnqlmcrp3Xg5Ab/ogH6JHaY3RHnU8OEXvtuuNUFynzSK4WhEJ1
	 Ql+i3pkSdoIGaNNWGtwDHi4QMOEkL7tBq62fVJt1lNlR+z7iNgxiCdXsfpzx9Zg8z2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+kzbAXF6Q7HKw8jGGGgdN+4kZFhaf1FTj8cFnPCPCbk=;
	b=5jd/bfRK/xhBul2wMohUjqSR0RTLGo0oGHAYv3cYvENutNRvR1BtzoMbtFnSwpqkvyj/
	 3zMAkOZubpmkb1XoulgReJqax4jidhkfMGq9ly1KLNMSgoRGfbSGqlXuJa1z+qJqyh/pL
	 OcdcVi+ykNReUYNDWchgLe0VrHfhyj/nwMf7bkZ8GhMV8JJHog+2NQ3NudgUsi6dcv6H2
	 IDe93IFt3yHDy/WihghbQtYt84UlG1UnTgumS4EWRSIBFUtiVTwrJ/A3NzS7mdEbZ/CeJ
	 N+SHs7beLVxCq48m4knazmfRceWAXGievR1uPDTwMw45VInPVrvUx3FBL6xsrtfdy8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=is.s.u-tokyo.ac.jp;
	spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp;
	dkim=pass header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=ZRiZttZg;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83E9606A331
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 09:25:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B83E9606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=ZRiZttZg
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3712b6d9843so2443727eec.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 01:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=is.s.u-tokyo.ac.jp; s=google; t=1794821100; x=1795425900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+kzbAXF6Q7HKw8jGGGgdN+4kZFhaf1FTj8cFnPCPCbk=;
        b=ZRiZttZgcfd62niaHc7feOuFxoxJnigtmUhpbCsLqYNjpOipU4Fr0UYiNcKTP09NAr
         4pM+Chmj005G94afM6s2MpaNbRQmwPS+MUiAorRxSSlWZZ26uIo0cunIBCcDpMthecS/
         LDaUiqyTPJZlHMFzL0kHjEz+9S2jMTW4T8mmJ1a1xPgYg+nq/CjaRPNrqS/brIryF9bx
         7nia8eCgjgDGqPIM/75kYF2t6r2PAaOi2WGrmEDQqsXTXA7qdD7aizkaFeug7L+GId7R
         kFAtWQ/t+eUBmV45hZ5UTVN8mWlkHe1HA/fVZYuboPydRb4AnekTfKygqPP9EBtsApf1
         FjMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821100; x=1795425900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+kzbAXF6Q7HKw8jGGGgdN+4kZFhaf1FTj8cFnPCPCbk=;
        b=tYj6iYToUAQRE+StrzdvXpUoca7nr5xkuqMzSiOU2yxPgD1RjJYQzVLUjgz8W+51db
         2qn9yq+Y65PC7Cj/pMZmw+rT9wnlyftzrwR1B1qRylIkkK/9PDI3ZykJIFADmeMrNby0
         pWnulhuXIM8Z6LrKrRT4/Bk8vQGX93lNt1SqSbjcdnqbyNngJCBurnv1DXnsmyPP2JMC
         KaZbYhSPIpNnqfEjqcfxKJz3vakus7OJP9o1xT9sh5lKhU+OKvXkafIdTe6koVJ3IHVW
         rIUVfgCM7Qk5BlGrdZ0eDPUDyGP/76K5Dnyf2nvaCP1hAlrAjOHRAQDRl8XUacf8nisE
         itlQ==
X-Forwarded-Encrypted: i=1; AL+hErHaYA5LXsj+ffGWoN3NnLdrHg+ahXHTGCQ2tfUvi/0vl3N25nxpLxjCaJ+UV9LOjmVQBkFHrw4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HiHg8w6EifaGYBM1T/FAayMHcYS2UNRB7IYMRpRs9nlXgwjFj
	zSdCncg8YE+45Jys5pCqFa0C9v/wiFdTj18bYKWRjr2udIM079n2cZKS42aYtmmgNA==
X-Gm-Gg: AZFdTZfvvTGa+W8iJI1sn7FQeImsiUXQ2kVR/qUoricy0GvltjnfVhiKfGMjgoB861V
	rNZjneuXOiQIFdIxMcuR/2Xz5HXRBR+AJRYot71eKqmGoRWOWLkwf9kSIAH/LQF7UFSQmiR9+kN
	xqssdMKrEbqp2aNN/Y+OFPnMN7Y1omT+is8LnQd6/P65GC6yuYtPvljPN51siNsPR1aYC8NFAC5
	Uwv0lh5Rr/SUTP3FdmEihuNSkiyymPNB5YzHK96QaROZY0FoKQTiati6ELeLAKpGckjQsmb5ZH2
	DSAWB9RTIA13mZ+rcX/sf3R92S8eYGWbmWxafHfjkoHq32DC+6HM5oo3MeeBK46L74no5otUWYE
	kW0+VzW2u0FjJ8peXwUjuiMEjB7oJIkrV9+Q+H4WtLvl7mMEJohaa9wVJLtqXKT0nY6FO3n8KiZ
	MgM7deDsHOK85/kZyANx6sh8NEelL65od2zd5kAz4b/GJ6xoSaqVdGL6ZFPC6Irb7azhcJo1BYA
	oAjOv89bmmLVMSep3BAaQ2QOM41CU1on7+Bm2ymFyA3kZzh1lSbJkpl0wmis7p8Ux7IesDNK509
	7VzYusfGTT/04nNlgXU7waSoYG0IdnirL0q2zA==
X-Received: by 2002:a05:7301:6184:20b0:36e:a179:85f2 with SMTP id 5a478bee46e88-379675fea57mr9358295eec.23.1794821099594;
        Mon, 16 Nov 2026 01:24:59 -0800 (PST)
Received: from wang0.localdomain ([133.11.33.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad6casm32056314eec.26.2026.11.16.01.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:24:59 -0800 (PST)
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
	Takahiro Shinagawa <shina@is.s.u-tokyo.ac.jp>
Subject: [PATCH net v3 4/4] virtio_net: report a failed stats command as an error
Date: Mon, 16 Nov 2026 18:24:45 +0900
Message-ID: <20261116092445.3391334-5-lian@is.s.u-tokyo.ac.jp>
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

__virtnet_get_hw_stats() returns 0 when the VIRTIO_NET_CTRL_STATS_GET
command fails, so ethtool -S reports every hardware counter as 0
without the "Failed to get hw stats." warning.

Return -EINVAL instead, as virtnet_probe() does for
VIRTIO_NET_CTRL_STATS_QUERY.

Claude Opus 5.5 was used to draft this patch. To test, the virtio-net
device in QEMU was modified to offer device statistics and to fail the
command. With this patch, ethtool -S triggers the warning.

Reported-by: Jakub Kicinski <kuba@kernel.org>
Link: https://lore.kernel.org/all/20261110001659.1654289-2-kuba@kernel.org/
Fixes: 941168f8b40e ("virtio_net: support device stats")
Signed-off-by: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
---
v3:
- New patch.

 drivers/net/virtio_net.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index b9b6c915b6f3..185ac95b9b1b 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -4980,17 +4980,14 @@ static int __virtnet_get_hw_stats(struct virtnet_info *vi,
 	struct scatterlist sgs_in, sgs_out;
 	void *p;
 	u32 qid;
-	int ok;
 
 	sg_init_one(&sgs_out, req, req_size);
 	sg_init_one(&sgs_in, reply, res_size);
 
-	ok = virtnet_send_command_reply(vi, VIRTIO_NET_CTRL_STATS,
+	if (!virtnet_send_command_reply(vi, VIRTIO_NET_CTRL_STATS,
 					VIRTIO_NET_CTRL_STATS_GET,
-					&sgs_out, &sgs_in);
-
-	if (!ok)
-		return ok;
+					&sgs_out, &sgs_in))
+		return -EINVAL;
 
 	for (p = reply; p - reply < res_size; p += le16_to_cpu(hdr->size)) {
 		hdr = p;
-- 
2.56.1

