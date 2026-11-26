Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702305;
	b=hyRVvaoND8jY5uEQFkASDVSAvbsKOdOur/Vo10YfkGcSLu6+hqVLaW59jWuMCjxR5nDY
	 qBqX6z/2mQL2LVoH1pjAkmOlWP7ibcailGGE/GQvcGZ68jTBfMNpi0/tczywvQO+myqQG
	 J/q2+UMcVyfwgxXlSZhB3BbQm0XuAx38kR28fo41B+N7o9/OynuZT9t1ooCL9P2fvM00j
	 Ah6SpLjmsyZT+5G0h/8cHhbH8RTRfOBxrfvgsy81PKkKKqD8WECuUNbdjKj2Jn6FV+6cs
	 HE/hyReXaFdWMgh81tibv+V4jV35l6iD3iEz4gJwtW/FdSSZyGBJITBiOuuCPVxbxjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SIPEnBq5swfaGOWjM7OKRb+08GCvFMc6ZKvXcYeopSk=;
	b=Tb0voltSzX4HkAjMtO4gmFXjTCpd7APURUfBfUeuqVcG/Z91DHN0DMTv9Fml+IGAam6M
	 W7ycGYmQoVPN6eTTZdEOWJYD71X7zzzyv/cTrRNLiYEnuVEyDy+k+WfauT1fCtdydG/73
	 YoXAQ7YLocdAj72q2a2br4JULz0FUZYktj1XIbNdboETBezBKGc+3nvCzly2vtnFM8rnt
	 M9a6lZYXciBZlF9d9poXwZYREst27KvscY9i0wAJVb2QR48zEHzwAQgWbv14giFYrYKmZ
	 j21639dDb/9ZnDYYN9k5rSie4dI23LsRhwhTcBrgiTl0kgN358tlAd2B0xqyIBAPJAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xoFgkRj3;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52FA606A321
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 14:11:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C52FA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xoFgkRj3
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-386ab9ab619so9298616eec.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 06:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795702304; x=1796307104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SIPEnBq5swfaGOWjM7OKRb+08GCvFMc6ZKvXcYeopSk=;
        b=xoFgkRj3S0huSnly/WZdCAADdCEjGU57jgkW8vci4qnSORm4mPWdi+J8wFI1uoYAZX
         nM6mwmT68c2D+DkXRfDfW7VKZHXpDKzItFF0y6gEKBRXXG574BUrFs2WetHIi/NEu0Wj
         nlDNHxVMef/kAyfFompzziGA7R58m8KVc/SnHmaqJArK4zcxo6nn39HEt88l+mkN//mD
         UsZdVI1/JDMZFrLYtuAXT4v/LzH+KHKM3Vx3QU+ucsfCD0iqf4auAZQfYDaz+YhDqLR5
         u5aRQ1bhmb2Mat9feuI8HLWBz3GaaeIN8pZR0sJTlgMZv4sUvZchqCHSoIeoOpACphht
         5b4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702304; x=1796307104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SIPEnBq5swfaGOWjM7OKRb+08GCvFMc6ZKvXcYeopSk=;
        b=R940bLArUQjMbVbKM+q6wW03/jgCgzgBf7iOeVvTOt7nxdppLR31NqP3e8Knyh2pFP
         CFuKIXd+esgHqf5pwdQ2CjF2CFUg8SwwTaDDyee0ForN88nfmfMnQ+ZrzJKpIYHL7miN
         8ol1bW6VyX6vOr2Zk3B44BHGXpr4/+o4X0SJmb8sulGGBi3/VSgPAY5X/mS+SPAYujlr
         C8DNiEqAZjgHbmHFtWuIQf5eO3yf69hhMF83f6PRKnhkMqlnNBsELIlCXFYImsqzGLd/
         b7wLTjdlkWcGJm8kyPY/T6csWY6mtlu4wbCf/xKiBoXsTkzIuQ7NDS/T7EQh0Y4+gFa4
         dukQ==
X-Forwarded-Encrypted: i=1; AL+hErFxVyrANmptnAzEBvFPIfyXBBAjT10wkpuYAufKRr9ogNtE3RR7TEV1GsdKFPsSkJGXOkRVlhA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WolL+3MGwmnF5K1drABpNKMjlofJngBefAykKFMSn9WL79YoP
	6k6Ugkd+B5fG6IZDamyvvc6+brsMsPP44iu49OZLxYwPcOBmR6KMS1xS
X-Gm-Gg: AZFdTZfthD5OMxW/+8eUNHMT/2pV+OZcRKnX8U5S5iC4XZVBnRHVjnTQUjsQhD41C/o
	Bg94nP6XwZaiXBBbflmGAwO07ryM6F9scfdnji/KSUkQap5rcdfY418IqStndAQKHHs0lTR6kiy
	ewIc9PRYBWr9ch5PJx6SrgFy6iu7TVOXhGWL9gfm6CK9n1B0OejjD4yX/cSV0a1YGn8bNvXaH62
	znfemONOGH5SgCdeDdrZlfaa8msKMN8rPVt0EmM+8/XodKK58rHVYwQxfdeL2jwIkDiRcVRig+A
	ZTxpUpniI0vnL3z1LECNd2o8Kzkz3IH9+IGJyVH2nK3q7lFkkZVgytMNF1Ze1/sX7BERCIpSGQl
	4UcMj/Jb8zKO1kKu24JZC1Nuq6DSF9jtEKwnv+eq/KzD/4hg0ULSoXJ8+KpyOtaBwKANlxndQbg
	c+eYQki4BWvDtjuitDxhMsY9k/szlBz4YaxmyTFhF98y4Ze151OR1C0FgvFfarArbgzUMn7dO21
	RbvxLyKqpSlE76Ybb5DyW3ENyp7QI1UFYsx3Ay8FybChx13oGNL8kCAFRMVfHu8GB3qZY/ym0Xm
	rrZ6JRS6MADgqHKW/MwbE6W5iFmxLGBSFe//gVmUL2QFsjB5lWiVN3fthcuFol5DLa//W9w=
X-Received: by 2002:a05:7301:2e30:b0:376:19bd:2af9 with SMTP id 5a478bee46e88-3856c2c4a0dmr23894136eec.5.1795702303786;
        Thu, 26 Nov 2026 06:11:43 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm77037988eec.4.2026.11.26.06.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:11:43 -0800 (PST)
From: Junyoung Jang <graypanda.inzag@gmail.com>
To: Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Gwanhyun Lee <gwanhyunlee@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net/sched: sch_choke: fix skb leak on packet ring wrap
Date: Thu, 26 Nov 2026 23:11:36 +0900
Message-ID: <20261126141137.1261866-1-graypanda.inzag@gmail.com>
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

CHOKe represents an empty ring with q->head == q->tail. When
choke_drop_by_idx() drops a matched packet from the middle of the ring,
it clears q->tab[idx] and decrements sch->q.qlen without reducing
choke_len(q).

Repeated interior drops allow choke_len(q) to reach q->tab_mask while
sch->q.qlen is still below q->limit. Enqueuing another packet then
advances q->tail onto q->head with live skbs still in q->tab.

Once wrapped, choke_dequeue() and choke_reset() see an empty ring,
stalling dequeue and leaking all queued skbs on qdisc reset or deletion.
If sch->q.qlen is still below q->limit after the wrap, subsequent
choke_enqueue() calls also overwrite live q->tab entries in place,
leaking skbs during normal packet processing.

Check choke_len(q) < q->tab_mask in choke_enqueue() to preserve an empty
slot and prevent the ring from wrapping.

An in-house LLM-based analysis tool developed by the authors
assisted in surfacing this bug candidate and drafting the initial notes.
Root-cause analysis, patch code, and reproducer results were manually
reviewed and independently verified by the authors.

Fixes: 45e144339ac5 ("sched: CHOKe flow scheduler")
Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
---
Tested on net/main in QEMU with a C reproducer that fills a 4,095-packet
CHOKe ring (tab_mask = 4095), triggers one interior matched drop, and
sends one more packet:
  - Before: q->tail wrapped onto q->head, and deleting the qdisc freed
    none of the 4,095 queued skbs (traced via kfree_skb).
  - After: the extra packet hit pdrops, and deleting the qdisc freed all
    4,094 remaining skbs.

 net/sched/sch_choke.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/sched/sch_choke.c b/net/sched/sch_choke.c
index 73d3e673dc7b..92d4f29acf57 100644
--- a/net/sched/sch_choke.c
+++ b/net/sched/sch_choke.c
@@ -268,7 +268,7 @@ static int choke_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 	}
 
 	/* Admit new packet */
-	if (sch->q.qlen < q->limit) {
+	if (sch->q.qlen < q->limit && choke_len(q) < q->tab_mask) {
 		q->tab[q->tail] = skb;
 		q->tail = (q->tail + 1) & q->tab_mask;
 		qdisc_qlen_inc(sch);

base-commit: ae8e5ef9fa9eeaf4ee0a9a9bde0fc63023d9b154
-- 
2.43.0

