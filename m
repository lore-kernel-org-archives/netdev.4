Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795492947;
	b=0Dmbl7F6vUJGVWzlgjss6xFlggBA925l7kHbZZJ8/TpbIuoNDYtDCxzs2UY26TqFowav
	 zxk7UF/x21nZHRRNxFQDfF/mh4L2b1pQXUeHsAZIMLXhfOBL29I2xGwydScJeQuDrbXCT
	 sMHdMelowHLriE3w9odVFUCGZGU2G8vrQWPr00whjnK0a1eEcO/MTcBzAIs3xeNPjB5Rc
	 s4YDRE5sxUPTBYzBM140BgFe2V5MlJK0pe/bgvnsci1/eGxmItqMQyXpt+5qHpdXw2WI+
	 FXIZwGEkVmZ+w9oxTpFcadAIAzqT9QGA4axwYWcLORYjZTtInzZTBb08R7VwnqRNCvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795492947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TQU/HIX5TEt1B81IWYObhBXBEJngh0gUw6npxUDBNUE=;
	b=xuWKy6FWisthJvy1R9qZX1KCt80JcGbHnXA10QN984dR9O/GsDiNrYVUM/jD6fYUllqV
	 AE3ZgOVVsUxstH50ceEKPhoZdL++NFHZeOtkHS8+OSoeV5DdMZo6g4Q9ukJ7wkROGaeWd
	 1w4oBex7I2oUDJzq28OUEOuEYlBqsz3zcFyV1WSZ6U46w+4FTmKBKxSyLh79uOBVEquPh
	 qN9vRYKdS9A+CzCxjmBcZelX2nyCnc3x7zpgA2s03AiGOrSeAz1bnkodxhLT57+tebLWh
	 Y9l/eTmOhAkE3NsWqPf8MAzYh5xBjC1Pi7V0s5w4e+O0zV4MZHwv04v7WZyQ2+SzzXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Z8Jvq/NB";
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F3C606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 04:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05F3C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z8Jvq/NB
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f04f61282dso15861365ad.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 20:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795492946; x=1796097746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TQU/HIX5TEt1B81IWYObhBXBEJngh0gUw6npxUDBNUE=;
        b=Z8Jvq/NBdpYzCcne54+bFLSc517CjxZ8f9t/fxqRS4JaXg1NvBCT0lg7/BGRehku8Y
         57oMa5SJRygDDspteLr3UBXE94RD566Z2pjCmZJxt5QUWzMDC12VpWP2In1SwlGRkwfm
         gbhE3KHFKBbX4552yTA6I3BGFDUD5eNQbV7xpsETTFJeSWcxcZ+ErLhj6WPKREHQgTpA
         tvth68v7isiJXWeGiMDdn56TEuNvAd+nYwEym+lXdzyNB/WMVfLydX8ZfXyE7DccglnP
         /iZyDz5V8P/CjH85wA621E2lFK+yfTPXkGlmnxAJgTrawc6XB79J0BWZYpYPgZGLo/tk
         WKMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795492946; x=1796097746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TQU/HIX5TEt1B81IWYObhBXBEJngh0gUw6npxUDBNUE=;
        b=bLyRbVpxtmjM7HIlhqU5xiFsicOfq69l/+sl5ESuMC72dmA+YKKevs3MCZEKjUtMrM
         5mgZAKFyEBToaU9c2BVuhD9ixx5phJz4o28H2qzPbcwCe+vUXkh0m/DMVgCQJasXAmrH
         FbHqSNSIkL9lTLlYuOa2q+MPwxC8zoYufclmlH5mXEJEs1LHS/7sK8V7w4+r+IrejemF
         jpHZVkaClNs4daS4o0fl/Nc/ZOMIdiLL/lS2gLVDhylrgwykFzvW5Z+iXfgZkFYTCjqG
         AXW7tB5unJRyp5wKmnGsk1KINGVfcU3oTtOqkvf2vbk6BQsRWU9CkCtmhaM6IsEenFB7
         pCUw==
X-Forwarded-Encrypted: i=1; AL+hErHSLc+I0rHsWqOgwfAv7cGyp6mBr1dq1x0ENSaQ1AxKm6zppop4JyN+Fb0gyqd3lWRjxA7Ezis=@vger.kernel.org
X-Gm-Message-State: APuU4Z9aBcG1VYd9QH9iCZY0sSqYufJzulfb/TIE5Mg975RVWiF+Ulm1
	QnHgg/fyz3O/mwKqbRxhLyVCJkXbUaepGJJwF7Ykg6QplVLZDZY7i8bMvizet8azoBM=
X-Gm-Gg: AZFdTZeU3mZuKuQmQTiGUg2s/nEuQv8zVUL9TGczJNIHKOksSEesofXAyzSe4zt34GN
	uHi5Xqf2DvGWXojIjuyIrso+qQmTM+uRQnHZSBILmTN20X2Mh7ljlwNi+G9/3DuTwvz69qsUfdr
	Hop5jKsO5grnXjCdUckcwStbgmYb2ghSOgqLxSDXXOxy7g2xIlCk+6SDfmF6D5sM2QQJRECNZkU
	6AcfK1AzkyJ6Nd5Yyn/snup8q8KLX60fx5gCia0r6lKeKSDf1Had+cWZrhZ5GJw5/695Nj3xJ6k
	127XQIvheEdyplufTcf14vfjteHPuKau/M+RFRGjNDxKCXd+N/CGW0b/FJBLJv652XhniF5j4jH
	5MHWUySJF1CxR9S/TE7JpBG8Z0Chp+CBpEl1rxo5h8xN3xM0AYbCMf2XF0T7suy+pLcijHEE30o
	3ILyA6NTl45aUvcuMlG9EwuyfWTBFPchWemKYbDcR5XOmjBfEOsb6xcue4xkEiW7uB+gNZIvZVH
	loB2GwyiIUKuqjdVdQNvMg88/3EtJG5NLyVZ5kBQQ+mSTa4dtUVQFkarGd/merfs6nlxRgLDwPW
	hzKg8GKdG6OtCE3WOuUvMWRBSVIZbEN6ssFwG7JNKrHTOUYVuxNk6uK6COxXcqwew6sYUTwJSQ=
	=
X-Received: by 2002:a17:903:40d1:b0:2f0:b599:8c98 with SMTP id d9443c01a7336-2f0b5998f1emr21408035ad.42.1795492946134;
        Mon, 23 Nov 2026 20:02:26 -0800 (PST)
Received: from JIAPENGLIN-MC0.tencent.com ([43.132.141.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f08164dacbsm33115955ad.68.2026.11.23.20.02.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 20:02:25 -0800 (PST)
From: Lin Jiapeng <ljp1205831794@gmail.com>
To: jhs@mojatatu.com,
	jiri@resnulli.us,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	paolo.valente@unimore.it,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Lin Jiapeng <jiapenglin@tencent.com>,
	TencentOS Corvus AI <corvus@tencent.com>
Subject: [PATCH v2 net] net/sched: sch_qfq: bound backward slot rotation
Date: Tue, 24 Nov 2026 12:01:43 +0800
Message-ID: <20261124040208.13282-1-ljp1205831794@gmail.com>
X-Mailer: git-send-email 2.55.0
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

From: Lin Jiapeng <jiapenglin@tencent.com>

QFQ+ keeps aggregates in timestamp-ordered slots and rotates the
occupied-slot bitmap when a group's start time decreases, avoiding the
need to move the aggregates themselves. Insertions are capped so that
occupied slots leave room for a later backward adjustment.

A stale aggregate can make the decrease larger than the slots can
represent. Rotation can then drop occupied bits or alias distinct logical
slots onto one physical hlist, and a later removal can clear bits in the
following slot-list pointers or leave stale bits. KASAN reports a
slab-use-after-free read of size 8 in qfq_choose_next_agg+0xd04/0xd90 by
task repro/92 after the corrupted group is selected, followed by a panic.

Limit backward rotation using the highest occupied bit so every occupied
offset remains below QFQ_MAX_SLOTS. If the decrease exceeds that limit,
move the activating aggregate's S/F and rounded start time forward by the
same slot-aligned delta before rotating. This preserves its service
interval and the logical-to-physical slot mapping, including repeated
rotations, while leaving representable rotations unchanged.

Fixes: 462dbc9101ac ("pkt_sched: QFQ Plus: fair-queueing service at DRR cost")
Reported-by: TencentOS Corvus AI <corvus@tencent.com>
Link: https://lore.kernel.org/all/20261116121710.77403-1-ljp1205831794@gmail.com/
Signed-off-by: Lin Jiapeng <jiapenglin@tencent.com>
---
v2:
 - Derive the backward rotation limit from the highest occupied slot.
 - Keep occupied offsets below QFQ_MAX_SLOTS to prevent hlist aliasing.
 - Update the insertion and rotation comments.

v1: https://lore.kernel.org/all/20261116121710.77403-1-ljp1205831794@gmail.com/

 net/sched/sch_qfq.c |   23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/net/sched/sch_qfq.c b/net/sched/sch_qfq.c
index e900890e9c54..3e2b40bea668 100644
--- a/net/sched/sch_qfq.c
+++ b/net/sched/sch_qfq.c
@@ -843,9 +843,9 @@ static void qfq_make_eligible(struct qfq_sched *q)
  * The index of the slot in which the input aggregate agg is to be
  * inserted must not be higher than QFQ_MAX_SLOTS-2. There is a '-2'
  * and not a '-1' because the start time of the group may be moved
- * backward by one slot after the aggregate has been inserted, and
- * this would cause non-empty slots to be right-shifted by one
- * position.
+ * backward after the aggregate has been inserted, and this would cause
+ * non-empty slots to be right-shifted. Backward rotation is separately
+ * bounded so that every occupied slot stays below QFQ_MAX_SLOTS.
  *
  * QFQ+ fully satisfies this bound to the slot index if the parameters
  * of the classes are not changed dynamically, and if QFQ+ never
@@ -965,7 +965,8 @@ static struct qfq_aggregate *qfq_slot_scan(struct qfq_group *grp)
  * because we use ffs() to find the first non-empty slot.
  * This covers decreases in the group's start time, but what about
  * increases of the start time ?
- * Here too we should make sure that i is less than 32
+ * The caller keeps every occupied slot below QFQ_MAX_SLOTS after the
+ * shift, preserving the one-to-one mapping between bits and bucket lists.
  */
 static void qfq_slot_rotate(struct qfq_group *grp, u64 roundedS)
 {
@@ -1300,7 +1301,8 @@ static int qfq_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 static void qfq_schedule_agg(struct qfq_sched *q, struct qfq_aggregate *agg)
 {
 	struct qfq_group *grp = agg->grp;
-	u64 roundedS;
+	u64 roundedS, slot;
+	unsigned int max_back;
 	int s;
 
 	roundedS = qfq_round_down(agg->S, grp->slot_shift);
@@ -1318,6 +1320,17 @@ static void qfq_schedule_agg(struct qfq_sched *q, struct qfq_aggregate *agg)
 		if (!qfq_gt(grp->S, agg->S))
 			goto skip_update;
 
+		slot = (grp->S - roundedS) >> grp->slot_shift;
+		max_back = QFQ_MAX_SLOTS - 1 - __fls(grp->full_slots);
+		if (unlikely(slot > max_back)) {
+			u64 deltaS = grp->S - roundedS -
+				((u64)max_back << grp->slot_shift);
+
+			agg->S += deltaS;
+			agg->F += deltaS;
+			roundedS += deltaS;
+		}
+
 		/* create a slot for this agg->S */
 		qfq_slot_rotate(grp, roundedS);
 		/* group was surely ineligible, remove */
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.55.0
