Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794670708;
	b=1bYSRSjYFNgIPWl1G8UlJgRiuDl8BI11A1s4X8CArWgiAnU8riKR9mV1F42PtibOQhYX
	 ac2weE+5fcvWgRQKV9NVSjJENQOR5bQRjNQYApB8ZABeJkxM/dWNqRovkjRSfKZo6Bp14
	 jel2DzvA09bJTMn24i3JGccAOTuxDXgd4v1SXVYJcZrKI3OHhJu4PrS0pE7KItmihErsC
	 +mfs5SNuUjiHRD42dFM86VSJp4YphsEJYNSaLOdyPZ5exFHQ60b1aUFXl8aD9wpSCg3Gx
	 lCiAm7ZEYpsbAE7B+ZmXSeU4Kbw60qaU7LYIna66H0FKg8Ehq+U2DR/bBvLnwk9iUIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794670708;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=4xB13t/qikSGlf5PM+4NV5sg6iC2/DLGLtE12IAvGY4=;
	b=MxhSoHtlNZW/8hazM0/0nazC0v7kfcO/AqTs3KAWS9rUS+ieKoFpDBAJywKdZ5aiojIi
	 v6qHMHB3W4cR+ulHD28vyCupVm4w8Gi57qmB/rD6onLS6mKn9LQoVaxgEzDLr2KFcqJbe
	 P32H/FRdq/n7si911Yb8+soC1K7kE7hJK8im7CtgCgEtYIdYMGlNvI1IbGvgaw72C989W
	 Pnq3s5TFHGriUv24/cOsM3pE4U/wUF8h9gdZzJYqIAIW5DFWr5EiZMwiYeMGxEhcLPkDD
	 78EW/OMvqeYh+Qh/aQuRtohT5bN3tBrJSvWCyG4XtkFvz2XUKXp9XbRR0GjBiloFzag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JMK0lNWQ;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CCA606A323
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 15:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84CCA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JMK0lNWQ
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1a3c08d6928so2720953c88.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 07:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794670708; x=1795275508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4xB13t/qikSGlf5PM+4NV5sg6iC2/DLGLtE12IAvGY4=;
        b=JMK0lNWQ4acWBiUS8eVeyG451iSPxaDJGQL+kQ1xkFo+XDmzc8+HXj2AqPLOoun/w2
         W367K0mWM8/dG865GvIMPnFQIG3CtuUS6gp0iLJN7XfdKIOXByLk3rpKqSfTZs2Poi9C
         l9h6apnrN6yd2aIyf6NsR9MjM+kbtaoi19uHHX3S5BZKTStD8gNnbBMMDPH65rF7FTH6
         cUgftdWeVVQVTOw5XNVKBO5GArgg4SwSxl9/izRqsdxfedU679aNhUNNOfraCNzoKE4I
         UwW2nE1bdRhSrqU9YyhMFx60zxcPb1PIlJHwFpXnqBx54OpT6CMUcgzEdlFvwP5SoWG7
         5LnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794670708; x=1795275508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4xB13t/qikSGlf5PM+4NV5sg6iC2/DLGLtE12IAvGY4=;
        b=iDIqJLQKQ/BxdXh5e2N+gG6/TFppJ8vkFSY7+YmrEWCfYaI+0LTml45R4I6rwhCBeL
         6xmLA0nU6O4GyT6iWOyob7vYQu3rav7SLx2sgtpcqh+Hdhbf/kXZ9qkXHdSQDTTXG4iD
         y0/c+l3FtGOjtmQPL2keLJyrM9aAT8+ItVDXoeJ4rbDEXkIl3Lj+CbMH2SiQB+C6s3JL
         B7uWERaM3KENdY2QRi0vkRDXrfq6imIYB/5J4Zz1WTi0zFzl73+a8fbt5/+926uAvR7A
         MbULeFgYTQERmXLkE/CK6didjhnLjurJFc2XKU4WROKyOkgsJYMzBhoCDKlH5UFokQgZ
         l94A==
X-Gm-Message-State: APuU4Z9J2BuopK6IHtu11KA+v96QmvtThINADR5j+LjFT9sDpNcq1Q67
	/lo6q52Q7liCe6dWpwW8HX/ymHDNDStCkPRT2mHXFEJVLwrAc9JijeNsuk/TLGrI
X-Gm-Gg: AYBFou2xhv4L6cAVfd3uJ5wSlzfAX1/ehZAVEeW8HvRUTXz6MBo5HvWnzdKWTyqXQpj
	vYznDcsmDomLDf3KcTRKMEpOpZrWp5WOJFJSXN9NMjj05RkQ7tXxa0RTeu9n0a7nTHpcrqxg8SX
	B/XIlAw8vj/w+tvXu/6ei17FNyR/1mOEQ4a46dBHkhpBormjYhUA1TF7jz34LXTgyaDPQlso+XS
	1Y7p/lpU76DjGqhha3wYeDMEcTFFftW/udpjq4FoFEGq/jw2Jm8UAaaqiLTtt8a7HpohqfPXJM7
	d01w+l3yg4fECNOOXZihdCm2aMqKnbARnoRY/IP0wYB6RTEi4bTtfBFmsZwRmkixZw3XmfkkIcC
	Erqgixu197zhYYWFydmGy9Qc9J5xhGIbfvJfFSa7WmZFYPJv53NKsmO8JFdxMEpyHGSwT4ZhUIh
	5Y9mTu8fEmaUYYLMbVbl1mOn+rhqPIXR7koUKRQISVGXuqSHHn9lG+LfFxXAgNhTnCh+YMHy+GS
	9IXL+V4HfvbOUoKgE431ScxVUoue8DGuvYjdaaTqvpcvvH/l7IZUSaYZkg/WoFVVbtkamSPvjjh
	j6hwlkZUW7KIVWqNbvWU4D2XKoIDOCJ1f/mQvDeSamcaZs2NkBa/J8lAJhmVAsVDoKLX5aldew=
	=
X-Received: by 2002:a05:701b:2202:b0:16e:c820:b20d with SMTP id a92af1059eb24-1b50302b736mr5463987c88.5.1794670707564;
        Sat, 14 Nov 2026 07:38:27 -0800 (PST)
Received: from umang-Inspiron-3501 ([2401:4900:1c60:38c8:74f6:e2c1:4674:3e44])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319e381sm16513014c88.12.2026.11.14.07.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 07:38:27 -0800 (PST)
From: Umang Pokhriyal <umangpokhriyall@gmail.com>
To: netdev@vger.kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] tun: don't steer a flow to a queue index that no longer exists
Date: Sat, 14 Nov 2026 21:06:17 +0530
Message-ID: <20261114153617.102288-1-umangpokhriyall@gmail.com>
X-Mailer: git-send-email 2.53.0
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

A multi-queue tun device keeps a flow table that maps each flow to the
index of the queue it last used, so that packets sent back to the flow
go to the same queue. When a queue is removed, the last queue moves
into its index. An entry that still holds the last queue's old index
then holds an index that no longer exists. Packets of that flow are
sent to queue 0 with a "selects TX queue" warning, until the flow sends
again or its entry expires after a few seconds.

Commit 4cc0a3f89707 ("tun: delete the flow entries of the moved queue
on detach") deletes those entries when the queue is removed. As the
Sashiko review linked below points out, a send running at the same
moment can still write the old index back right after the delete.

Rather than taking a lock on every send to close that window, check the
index when an entry is used. If the entry holds an index that no longer
exists, choose the queue by hash, as is done for a flow with no entry.
The index is read only once, since a concurrent send can change it.

The race has not been seen in practice. The fix was tested in a guest
with stale entries left in place. Flows that all went to queue 0 with
the warning are now spread over the remaining queues.

Link: https://lore.kernel.org/netdev/179415734502.994134.10139593761656069984@kernel.org/
Signed-off-by: Umang Pokhriyal <umangpokhriyall@gmail.com>
---
 drivers/net/tun.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index dcec7311e6..5367975ff8 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -471,13 +471,15 @@ static u16 tun_automq_select_queue(struct tun_struct *tun, struct sk_buff *skb)
 	txq = __skb_get_hash_symmetric(skb);
 	e = tun_flow_find(&tun->flows[tun_hashfn(txq)], txq);
 	if (e) {
+		u32 queue_index = READ_ONCE(e->queue_index);
+
 		tun_flow_save_rps_rxhash(e, txq);
-		txq = e->queue_index;
-	} else {
-		txq = reciprocal_scale(txq, numqueues);
+		/* A racing update can leave the old index of a moved queue */
+		if (likely(queue_index < numqueues))
+			return queue_index;
 	}
 
-	return txq;
+	return reciprocal_scale(txq, numqueues);
 }
 
 static u16 tun_ebpf_select_queue(struct tun_struct *tun, struct sk_buff *skb)
-- 
2.53.0

