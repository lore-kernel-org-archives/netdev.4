Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907663;
	b=sGNgZhl0X6DekK5OBPRmp0VBy8WDWpJPzV0dn6IjmBPT6TsgAVRk/Q7dKv/ZF0Bvkdup
	 Cnlz2cBv0HzLnEqGkgNEH92XHfQ9jtw6IlloRKXchCDuxDTMI18tCdGdO6RBVQ4OnsnSb
	 Dw4aTRsL3RetYR5TKN//vFKpM/c3vzjnqxJzQ+jg286AgPiKrcEKmwYgcMgDN4aH9886t
	 H+pY/7Pdrnnilb2AxSMG891nGYWRwGcgvWhHV89X74gfvjof6SebJld6rauDH5LCW4Nty
	 HIMzFgPy5zOPEnh8kGUrVFfyl1F027JhyD4EuUUp+cil3/TWbpMV9fM2boRRqhdKLrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aDSdHKsmTGGWkDOKCvZtMPEPFRR2Z2wRDeQx9ZQTN3o=;
	b=MmoXSmODA0XAMD1Mnc0gU6WlBoF4mINESv24QI6dZRkoXZidPEygDDEWwM5Oci2bIbJu
	 UbKuMlM06vT+48nVF9/50EeYhiKW8ms44LIsxAtj9PBm1t4uTTFjb3DUH1Oy5mvnA+TOk
	 ETucGFRvq2rUVEEJtGFjzX8Ys97lSX9591tZO35OoA5fzZ9Q2NEKGoSpiWrFwZf7jAWR3
	 zDuteQ3kVj06RCbjwvLkNb9QgquN82dvLRWhCiYZcYHJpA0mWgOw/3hcOVlsyVi+gn5KL
	 shNoSBkR4Dr6FDw13qyjGpmEFySAKTWYQpfwlkDUO7NHTuvydwjtTz430TtpD3i4M6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="0SeRLO/C";
	arc=none smtp.remote-ip=74.125.229.131
Received: from mail-dl2-f3.google.com (mail-dl2-f3.google.com [74.125.229.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3F9606A32A
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 09:27:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F3F9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0SeRLO/C
Received: by mail-dl2-f3.google.com with SMTP id a92af1059eb24-1521c45a248so3040298c88.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 01:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794907661; x=1795512461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aDSdHKsmTGGWkDOKCvZtMPEPFRR2Z2wRDeQx9ZQTN3o=;
        b=0SeRLO/Cu/Z7fD38T1aAPibopqP6aQGUmhp1Bo9C+KNJ0zCPPS4ridEDVsmduTWVMB
         IcSiChIYc5OtxT7LxawZZwt+I4vRJx+Vqq/qgo8Z8FQoveqYdA9YRJcwE/sXvxSDpMRr
         xicb0QeRwgjZ9gDwefSkUvHASJVJQlsYzMLlQ4EAKa7se1CKQDlqSiZO4Xwi4Wnc/QC2
         VNJwxXOQsdQW6+6QcfmItcKP+zjvb/hOjtnhCrZe6LlBjJf4dHf/HEeX6Tndo67/JG2A
         sGSH6TS8rkRN0Xbzr2uiSUXWh7FLBkPXcSgHu7bfSdxyrlnkvQ/DQ6n04bjGVmj+umb1
         eyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794907661; x=1795512461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aDSdHKsmTGGWkDOKCvZtMPEPFRR2Z2wRDeQx9ZQTN3o=;
        b=q+8NzXyvLw8RzJtoYMqiXoivN2e4na1w9tTe5sZsxJ/C/2RN1DyS0ZKluAiw9f1nVN
         tRP7lTuPPLa/XvFzoKzKe1XAlRHRlycaIuktSadoqU0HDpRSsbTQAYNYWNOjAIhcPtLV
         VvcOG3mON9YG+hSF3vugqt3jtbbRE4D7Pq/EdYPT3nFbap+tT3h9yi6Gb3y7szi9bhoZ
         0C7lQfMURkrG5f9dejcgQOvzYStD1CoT8XofdJTMXXixELAPmhif8y7qH6d+GODwTpj3
         tUldjpMMSDNh1mfYiX4h6kxIvojdRV/LMQDvZtPcdazeuhnIFgsRPe6lVFwQGSQtf/0u
         ZjkQ==
X-Forwarded-Encrypted: i=1; AL+hErEn7yNtjXiIMI4ShWPVAJMckyrfgUYoVgqntcpSbpAPJk6H0dWQSNxsimxy8YgB2Jgjfbv134I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LdQ4HjOd/tVaSYJCZgbza3CAADlErkC+ziQ5+bJ0/0yDKb4Dj
	MZZeTn5h2vXG+t1J7QtUud6MsoqoQdEifbzsnSzAPTIoj6uNHfR5HQhw
X-Gm-Gg: AYBFou0yoT2hRLixjf2mAMBoRImsQgm/IXbFM6px6ijpXCDJG2LPvz1kY/OOPn67VgY
	T2VlD88oJsoLR8/T94V2DriJq8X7trRIQQWOTH4LqmLi3OeuDNMnuKw6gChpkedTzFy47z8HniQ
	14bnFGgKXFrFipYta/7+G8HKySbFrV+C5RKG8Qh8X0Fb8AX2tBgXaaHwCFKfdZi3BHHKZMmqSxr
	5b0/1QcE/3m4CQn/XfAPuBBcLHnc003aVgXn8oqeWO/ZIPqpY5RvbgwGMfdzBg5QRIIEe3o0LTJ
	Own3HjK4W6KF7Cm1WXJHy/HxVJqjwDiXWH/qN8fqvD2dkC/SItboPShqLwLPGu1vP6oCWo3CXy5
	eAhrakJ/NO9275mdUEhvnFAUF2xb0y2gn9qEEWew6BAugE8CMhFf3qt4KqmzDv73IBoEKDTptJb
	5IYVl9+YxL1N0aOCBw9lEMncTXUf8AgVZ9c4SVmW+vgdjS4Me1gY8ZOkhRTb38yWThvluQLp2Vj
	6YZBb/wKw1teYG36vNl0o0bLCaOg++Gz+/ueKdTmlf3lkqXvBkmmVI0E2HsAX/Gm4TXm39SJbZl
	VmW9WmOu1IDeyVP9PtFz1LnGT3CHEWI9HjflcRpELjGAdvefaMHdSGX8ljQauPDY6heOA7NAgES
	WQA==
X-Received: by 2002:a05:7022:438e:b0:1b2:539b:496c with SMTP id a92af1059eb24-1b503175d03mr21231997c88.35.1794907661127;
        Tue, 17 Nov 2026 01:27:41 -0800 (PST)
Received: from DESKTOP-GSNRJ5L.tail4a8ad8.ts.net ([104.28.223.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50309b27dsm38381531c88.2.2026.11.17.01.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:27:40 -0800 (PST)
From: onLeaf <onleaf322@gmail.com>
To: pablo@netfilter.org,
	fw@strlen.de
Cc: phil@nwl.cc,
	kadlec@netfilter.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	onLeaf <onleaf322@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net] netfilter: ipset: exclude add-path GC during resize
Date: Tue, 17 Nov 2026 18:27:31 +0900
Message-ID: <20261117092731.14656-1-onleaf322@gmail.com>
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

mtype_resize() copies elements to the new table including their extension
pointers. Garbage collection of an expired element in the old table after
the copy therefore frees an extension still referenced by the new table.

Commit cffcf57bf03c ("netfilter: ipset: exclude gc when resize is in
progress") prevents the delayed-work collector from running during resize.
However, mtype_add() also invokes mtype_gc_do() directly when its target
region is full. The packet path can enter this call while a userspace
resize is copying the old table. It then frees the old copy's comment, and
collection of the published copy queues the same object for freeing again.

An unprivileged process can reach packet-side ipset add with CAP_NET_ADMIN
in newly created user and network namespaces. The resulting duplicate free
was reproduced with KASAN on x86-64 and exploited from UID 1000 to UID 0 in
the initial user namespace on a non-KASAN build.

Serialize the direct collector with the same GC lock and honor the pinned
table's resizing flag, just as the delayed-work collector does. The table
remains pinned by uref while the lock is held.

The issue was found through AI-assisted source review. On the fixed kernel,
the same copy/old-GC/publish/new-GC ordering completed without producing a
duplicate object; /etc/passwd remained unchanged and the test ended in
LPE_FAIL.

This change was prepared with assistance from OpenAI Codex.

Fixes: f66ee0410b1c ("netfilter: ipset: Fix "INFO: rcu detected stall in hash_xxx" reports")
Cc: stable@vger.kernel.org
Signed-off-by: onLeaf <onleaf322@gmail.com>
---
 net/netfilter/ipset/ip_set_hash_gen.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/net/netfilter/ipset/ip_set_hash_gen.h b/net/netfilter/ipset/ip_set_hash_gen.h
index 80ca523f304b..70f768ba7b44 100644
--- a/net/netfilter/ipset/ip_set_hash_gen.h
+++ b/net/netfilter/ipset/ip_set_hash_gen.h
@@ -1009,8 +1009,12 @@ mtype_add(struct ip_set *set, void *value, const struct ip_set_ext *ext,
 	maxelem = t->maxelem;
 	if (elements >= maxelem) {
 		u32 e;
-		if (SET_WITH_TIMEOUT(set))
-			mtype_gc_do(set, h, t, r);
+		if (SET_WITH_TIMEOUT(set)) {
+			spin_lock_bh(&h->gc.lock);
+			if (!t->resizing)
+				mtype_gc_do(set, h, t, r);
+			spin_unlock_bh(&h->gc.lock);
+		}
 		maxelem = h->maxelem;
 		elements = 0;
 		for (e = 0; e < ahash_numof_locks(t->htable_bits); e++)
-- 
2.43.0

