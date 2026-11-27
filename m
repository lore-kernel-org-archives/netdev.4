Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780683;
	b=wgiE/Y6Zw9uJw1XxR3tvy7YzJCEX5rAADtiRJx20cjjMGgOEgdmN6mXt1w+sTzMLczV2
	 wJhmcQ5WNdCedWB7AUrA+mJYcNio6sgUGl/3/zYqUhmKKXDoSvA93ndyFZvKEil8pkjYJ
	 YwvfSWdjzKhhUFqjq/NoMTUexE/H1U1s6AjM1jYi8gOWeSng6GXYM8HnGV9w+RYvVmyNF
	 BBblE48L/qIrIxDtzBgyhx9hg5Ms0BS4otIfmv1+M/OXTXJwvT+/2kl8qKs/y3Vpo6hFU
	 RZFiSZdOtMVfri/eOXOJT5Tady2EACwdPDj0lCAR/+jENTNc8YsGQXZdB/LkrIGAyZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780683;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=vQelcEuqyW64SaLRt+Djkwur9e0G+0Ni2ap/WcXwC4w=;
	b=OAfNloMKhQIE1siCz9O+1OTcntNNqk3w8VfaMf45PVVRAUdg+rI3kW8gcSUsMiRGTDA1
	 WxZXKz2tLCZ2WwYhXhNBrOWxuuHG8lrDEc1Bkz/Ebr+RhmX3Gqpf4KXjxfZ+rvSZudjBo
	 dx5/OX3wako3eaqJbnhR/sAzcglo0D4GHZFVmgaUdQFIkVMwlbKvsxS7H43a+e47iGvVJ
	 dJAb6FTTlF3eqDTHSP2HbB9S2BmVULxR9YQDFgDIXTNxctl3oewfJWVmNj12KeWOz5ZBR
	 0zV0ORrVlpnQjaz7d2zm7aKpEN3NADmioVtnCqajiphgM2MuAXOTtpoVWtd792eyM5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=MQMj42C1;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96AD606A31E
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 11:58:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C96AD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=MQMj42C1
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-94958650b09so761818585a.1
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 03:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795780682; x=1796385482; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vQelcEuqyW64SaLRt+Djkwur9e0G+0Ni2ap/WcXwC4w=;
        b=MQMj42C1fs0pst/gw1h/8Zn28WifOfiZHKiDT7brBj+BNWrL9j+1AJwome/4mfVxnw
         Ttn+rxWwMLDVHkLYON7QsIbgM+BtvXfuOx40UFULcA+qDPhV6e2SYBZveUbJ2PKqowyu
         qEdHNW7Y7siMI9+5a9AXGVf5wV5Ja7ZW//+jg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780682; x=1796385482;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vQelcEuqyW64SaLRt+Djkwur9e0G+0Ni2ap/WcXwC4w=;
        b=H7VlkxGunReF76hpF/XALCBnbGdPHb702Jcre+FWdqbcBPz2d8XJ3JVECyP7WMQfSt
         22AdxIsusTBzqV1PumQBbLgM7nJQUftAwYSPJyH3S1BmFSoNd/xGIft5yj/yqlJ4djvh
         HLMs0hloQ4jyKx8R2KRQnHjfqaFM53zBaFHmOR9GAZgIsBe4gL0Bm0F9NUXQcK3QbyaS
         S4l4qgS0ID7AGoyDg10RSO3yFyqZwf0wYJXJDDTmovK4Lv90g6vNRne19xSE5HZPwg7O
         CdYcs7rRT3BRRUhjabiDzIi7A8Svrv/QX0oYjakYzKUwyVNlJuvDJMWqTQVjmxnF6sVY
         Z4hQ==
X-Gm-Message-State: APuU4Z+zGSIGmk6GS31/zYB8F4csKVHpa6JaL5xgzxOjAIMy5+QwPdtW
	9ODNgkUMbtE6f/HmPE0MkLLwWOIiESPCJp1LZsndZiMUDkY6Mdk4Cro91nAsscr/gvsIe76MGEJ
	ADjM=
X-Gm-Gg: AZFdTZfZTt9K9Cyqnn6PFhxFoUPJ/Vd2by49/mmyqGI9z1taNDHi333tPSpjWhy/CgO
	E76awa6bf1Gr2FMD8XJdUgsWR/Mbam8/2xixVicgu7dxmZrdrquB6hqC9nvrAcO3JZU6VLZgGTX
	Eq2q1HWpbHMVjcl8hDxxkPLHCHMOr5/O9H9W8TGPi1ZM+A7pS17QRdFqQDkCQHcvqba0DkX3RTt
	93pQgU8aJ37ykx2V3GH3V0Nsy4YHeGigSeoEoh33jiKMV4lH38JTipbIaVeAQfQDBKUZJ2eY4P8
	hEEKLGGjIwV38Da8B3Rt6hs3tkT+F/PWLtb8cToZIMqxXeCE4TtP/cCRSwMuMrGDL7xJtUHDUSi
	4uTpEEjoUx2ls9uR5WpFXyP+VJcEKbuX/8IBnwSRGbYn9SndF+RE2QrX5ypUb1rz1PTnuA45R+T
	ATLB9BWXDFsNC/WsW8CUm4uFrlH2wgsY6J0W2arLkFX9FAydO+Hmm/TwVuokdAbKEWkiWFVNEzI
	rRmxOqSsNPJLl4IthHOmIzi5Fji4ibwlUqogFXjCks5nArLtEaKQJjCLKb2QXsyH7m3SlcUcMpa
	Bps01vjlgBNNZWfgbD41uAdQSb3147h7G7XBzLf+g38o6KuvbrdhgvUpztrrr2+H8Aqp/emDq2Q
	=
X-Received: by 2002:a05:620a:2695:b0:93f:334e:df21 with SMTP id af79cd13be357-949baa10494mr4479610385a.62.1795780681759;
        Fri, 27 Nov 2026 03:58:01 -0800 (PST)
Received: from mbili.waya ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949caf98d34sm1588177985a.2.2026.11.27.03.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:58:01 -0800 (PST)
From: Jamal Hadi Salim <jhs@mojatatu.com>
To: netdev@vger.kernel.org
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>,
	Stephen Hemminger <stephen@networkplumber.org>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	cake@lists.bufferbloat.net,
	Victor Nogueira <victor@mojatatu.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH net-next v13 2/4] net/sched: cake: use a dedicated split-GSO list iterator
Date: Fri, 27 Nov 2026 06:57:50 -0500
Message-Id: <QDISC-BA27.v13.r0.20261127065026-2@mojatatu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <QDISC-BA27.v13.r0.20261127065026@mojatatu.com>
References: <QDISC-BA27.v13.r0.20261127065026@mojatatu.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

skb_list_walk_safe(segs, segs, nskb) reuses the list head as the walk
cursor, so segs no longer names the segment list once the walk finishes.
Use a separate seg cursor to keep the head and the walker distinct. No
behaviour change.

Reviewed-by: Victor Nogueira <victor@mojatatu.com>
Acked-by: Toke Høiland-Jørgensen <toke@toke.dk>
Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>
---
 net/sched/sch_cake.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/net/sched/sch_cake.c b/net/sched/sch_cake.c
index 2480ee4b9575..2bc0dac9123a 100644
--- a/net/sched/sch_cake.c
+++ b/net/sched/sch_cake.c
@@ -1816,7 +1816,7 @@ static s32 cake_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 		WRITE_ONCE(b->max_skblen, len);
 
 	if (qdisc_pkt_segs(skb) > 1 && q->config->rate_flags & CAKE_FLAG_SPLIT_GSO) {
-		struct sk_buff *segs, *nskb;
+		struct sk_buff *segs, *nskb, *seg;
 		netdev_features_t features = netif_skb_features(skb);
 		unsigned int slen = 0, numsegs = 0;
 
@@ -1824,19 +1824,19 @@ static s32 cake_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 		if (IS_ERR_OR_NULL(segs))
 			return qdisc_drop(skb, sch, to_free);
 
-		skb_list_walk_safe(segs, segs, nskb) {
-			skb_mark_not_on_list(segs);
-			qdisc_skb_cb(segs)->pkt_len = segs->len;
-			qdisc_skb_cb(segs)->pkt_segs = 1;
-			cobalt_set_enqueue_time(segs, now);
-			get_cobalt_cb(segs)->adjusted_len = cake_overhead(q,
-									  segs);
-			flow_queue_add(flow, segs);
+		skb_list_walk_safe(segs, seg, nskb) {
+			skb_mark_not_on_list(seg);
+			qdisc_skb_cb(seg)->pkt_len = seg->len;
+			qdisc_skb_cb(seg)->pkt_segs = 1;
+			cobalt_set_enqueue_time(seg, now);
+			get_cobalt_cb(seg)->adjusted_len = cake_overhead(q,
+									 seg);
+			flow_queue_add(flow, seg);
 
 			qdisc_qlen_inc(sch);
 			numsegs++;
-			slen += segs->len;
-			q->buffer_used += segs->truesize;
+			q->buffer_used += seg->truesize;
+			slen += seg->len;
 			WRITE_ONCE(b->packets, b->packets + 1);
 		}
 
-- 
2.43.0

