Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795639736;
	b=CJqGstdxaTflevzdG3MqO1u1K3y0o0tO0uZdc0dmu4dUK5A11z5TYm+soFzyVMlfxIM5
	 QQAVeOUME17iv1GfYPp71Gt0CND+L+rzSKL2qSVqyzmjqw9mTL1xVi8AMghDsr5f3lFEi
	 GnS/RVW1FWaQJYCS7WVsxcmS8T/CDiTPOM/X/BzFRo4o6zNrCEtGrzZc5imFLeqp+1l4N
	 t2mhDN7PmW0uLehnKhLVZu1M95cKDiv4AU2qEGWH9rbLbH6tjb9iJSIIJCBEMVRhQW+uI
	 bjr39oOGrMhdmrOLzLqy6+Z3unmub/GaviIVrDYofM8oBkjpTQrtTHNbZ/p4W05nKrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795639736;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Q+068W+2xD4+j1OAnHhDnS+1yL4RhJkPVo+pu0EaQNs=;
	b=27I5EUcDyClH01Xj6ifJpfqK+0ip7macGIwgmCEdJJMbo0bWy78742UB2Vlqrplg/2JR
	 RTXB1lnMrF9b85KbJTQCa24EDCAm6lwALDZ4yAhd97XkFnHKYyrEjIPOP86+TMS/OjTzZ
	 WE8DC5NHn2IK1KipiL+TMZQJkjeGsenniOHk/xHkxTL99XCvqVNLbbJd8JRYKSeH/F9F2
	 63uuzZcZTluH78rzKa0N0G4dsCx9oiKlH6E6WyqD/6vptIqB7Ff3ZRYKcVzDbPS09Pl0B
	 gfujJEJJFT/O4rU8x9xBayoq3DpJfMbJdJlRd0FwFXfWOONsNswSddO+B0ZZFcdxo6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=trailofbits.com;
	spf=pass smtp.mailfrom=trailofbits.com;
	dkim=pass header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=CW9zVKAt;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51AD606A327
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 20:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C51AD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=CW9zVKAt
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1a2af4c8d00so5053385c88.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 12:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1795639735; x=1796244535; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q+068W+2xD4+j1OAnHhDnS+1yL4RhJkPVo+pu0EaQNs=;
        b=CW9zVKAtImhk98ywj0qR/nTojo3KfaibXbVblBTmXfJmQnc6Du6KEV0824RynnAIll
         wB1qKIHY86HGJf80wT9yXXYVYlPvcqYTW3pncS+LOguC2vpLK0JO7eCco0nz1mUWHlqa
         KmwRqnZQtSVGj1byIOqqlgqMWFfLmPAVFHvEzEUE9PAAx1cUG2mHWMnPlcE5V5XZyIXb
         HLpdGUovRvVKyHqNEpeJYb9SdZza7hJLuK5ekNtbxwv0j94Gtj/QqBkiH+CLu40rGCOk
         NVh0coAeJjIdezcLQaKd9+ATBsNISAEk7swhrJRoeQebpgehoS47SDIVXUNTg09nfBtP
         lOtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795639735; x=1796244535;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q+068W+2xD4+j1OAnHhDnS+1yL4RhJkPVo+pu0EaQNs=;
        b=sp+ohqyEzVbhUE+Ol3MftGTNYBxhz4H7E+mG8mY2y+JMc9GX+zoKrla5sW7Lxxakdl
         wwIdx7jmSHJiAB1YumiIaKH/SF3WJXqQIZxYVj0bY/v0QhCwQSmV0iSJXwyO24+toi5G
         BrNNthxkEbLsuxU9VmH9rh+TJkYIV+PZ6ZRsREaJgVjSL/tfcFg5yGs6LUiQNzMGzCC6
         FElTdPhRKDOeT4o//UB46tFqviO1DCk83pJ5Lifdmxp0AvJ3SQZP48TGYRtdbw80UxZl
         pXrkw3mS6ucXoFpKJPhzVq539iFXsucm3K3GEi2sJgUPOfofdhQ6Mo+fWqZCRSLHA8L1
         3Pew==
X-Forwarded-Encrypted: i=1; AL+hErHWe4chc2UHCvtpK/ec6Zcq8hXYWoTilInj7pRUBArVbtH89gqrPONppsfLD3qkU+9CQYccN8w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0hU9KEolqTCuDdM8oU2ubhODV9iShuHOyabNoYjHS7Ijuygx7
	f1WdrqsnmowkASQSpgl8vsOCJOkkJvSW49zCBpZUbf4THiTyRmNW9KxTn4TBhwe8UUg=
X-Gm-Gg: AZFdTZcceL3zP6HuHoYZApsa/+1e43VxNYwoiXUkkLatDDBd9WLjPlOm86M3wVxjqzb
	SUGZCjgxXNxBU1RmeVrM+hoDvP97k0Pdq4p3ibU01VFvU+ygjlG8i792EiUjts1HXk4W4tAZ6eQ
	vTYjTUPqri3GcgX+u2yDb+a+CbSNXQcS4eadwoDPgPqyvqKX64EIGJizcsX6klby/kwv3R3/+Y1
	OqyGIWaHWZPARqfEOLdsaAQiYupovg6xmRH8fr26s10FIr4WS5QS/wQUCY+C1+8oytVuYnpQMyD
	uIi1sJEsFZKL8EpZgWlxuS2VPVf0+sj12VJWPGgca42OLCD6aimLKkyufIwWNTqaZp2/Y8Hk6tD
	9veXdJXoHDuKfy9DbbHUPdTjkdP8QCfSy1J4hS6kC8b8ZVLlyPuOL5IqirWWzw43tG4/lPBPA6b
	msNytljPtuH0noSy5GDQSVGaQV5m/HZzGxiErDSSL9FdDaXZJ7Cvqgho161aUlyFKrkD3Og2C8W
	NME4qo4kDrdPQm5MSgAmhJ1ULhcGXYyzyDDFWoZt/e+idRmQR1sNQBQyZqaBxlIqtAPxk7hp2wt
	tWnwDYgyx8uvCAmBhFUtJ8XlfqbZUsuo4mNMJ9osJ4cZyRje5OQf1b3BbBVmEV20zdSNsxKM5+e
	zWzJwQ5Xx5TfI5ihdqmoldIYGgA==
X-Received: by 2002:a05:7022:3f0d:b0:1b5:58d:fd9b with SMTP id a92af1059eb24-1b5568f03b6mr20664947c88.31.1795639734644;
        Wed, 25 Nov 2026 12:48:54 -0800 (PST)
Received: from localhost.localdomain ([2603:8003:6d40:6669:75a7:83bd:63db:baa9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm42891258c88.2.2026.11.25.12.48.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 12:48:54 -0800 (PST)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	horms@kernel.org,
	jhs@mojatatu.com,
	kuba@kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	toke@toke.dk,
	victor@mojatatu.com
Subject: [PATCH 6.18.y] net/sched: codel: bound the dropping loop per dequeue call
Date: Wed, 25 Nov 2026 15:48:50 -0500
Message-ID: <20261125204850.72393-1-artem@trailofbits.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Sat, 12 Sep 2026 14:08:30 -0400

[ Upstream commit 7f4a5ec6258fd7c92633ec4b0493fc51166d9398 ]

The CoDel control law schedules the next drop one interval/sqrt(count)
after the previous drop, using the configured interval
(codel_params.interval). For very small intervals the scheduled step
rounds down to zero, so the dropping loop in codel_dequeue() never
advances and drains the entire backlog under the qdisc lock in one
call - an unprivileged user can trigger a soft lockup this way.

Fix in the shared codel code used by both codel and fq_codel:

1. Make the control-law step at least 1 tick so the dropping loop
   always moves forward.

2. Cap the dropping loop at CODEL_MAX_DROPS_PER_DEQUEUE (256) drops
   per codel_dequeue() call, resyncing drop_next to now when the cap
   is hit: the catch-up owed to the loop grows with the idle gap and
   the backlog, which no interval threshold can bound. This is a
   deliberate behaviour change after long idle gaps.

The cap applies to fq_codel (4b549a2ef4be) and the mac80211 TXQ path
(fixed interval, cap only).

The target sojourn delay (codel_params.target) is not validated: it
does not feed the control law, so a sub-tick value is aggressive
rather than deadlock-prone.

Conditions to recreate the bug:
  - tc qdisc add dev lo root handle 1: tbf rate 1kbit burst 2kb limit 1000000
  - tc qdisc add dev lo parent 1:1 handle 10: codel interval 2us target 1ms noecn limit 1000000 (same for fq_codel)
  - unpatched kernel: tc accepts it; a UDP flood under the 1kbit tbf
    soft-lockups (watchdog: BUG: soft lockup) while one
    codel_dequeue() call drops the backlog under the qdisc lock
  - patched kernel: same setup, at most 256 drops per dequeue call,
    no soft lockup

Testing: claim reproducer and interval 2us/3us variants run clean;
tdc qdisc category passes (see the selftests patch).

Fixes: 76e3cc126bb2 ("codel: Controlled Delay AQM")
Reported-by: Vega <vega@nebusec.ai>
Reviewed-by: Eric Dumazet <edumazet@google.com>
Tested-by: Victor Nogueira <victor@mojatatu.com>
Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>
Reviewed-by: Toke Høiland-Jørgensen <toke@toke.dk>
Link: https://patch.msgid.link/QDISC-1L5H.v1.20260912080102@mojatatu.com
Signed-off-by: Jakub Kicinski <kuba@kernel.org>

[ Backport to 6.18.y: context adjusted in codel_dequeue(); 6.18.y lacks
  the upstream WRITE_ONCE() annotations of the codel state. The added
  code is unchanged. ]
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi,

Please apply this backport to 6.18.y. It fixes CVE-2026-98427.

The fix is in 7.2.8 and in mainline since 7.3. It carries no stable tag
and so far has been backported only to 7.2.y. The upstream commit does
not apply to 6.18.y because of context in include/net/codel_impl.h. The
selftest patch mentioned in the changelog only adds tc-testing cases and
is not included.

Compiled net/sched/sch_codel.o, net/sched/sch_fq_codel.o and
net/mac80211/tx.o for x86_64 with CONFIG_WERROR=y, both on 6.18.65 and
on 6.18.65 with the queue-6.18 patches at stable-queue 42799ba370. The
patch also applies to the current queue (0fdc4475764), which adds a
net/mac80211/tx.c change; that tree was not built. No kernel boot or
runtime test was performed.

An LLM was used to prepare this backport and to check applicability and
stable-queue history; I reviewed the result.

Thanks,
Artem Dinaburg

 include/net/codel.h      |  5 +++++
 include/net/codel_impl.h | 16 +++++++++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/include/net/codel.h b/include/net/codel.h
index aa80f744826c..183d43c2bd43 100644
--- a/include/net/codel.h
+++ b/include/net/codel.h
@@ -140,6 +140,11 @@ struct codel_vars {
 /* needed shift to get a Q0.32 number from rec_inv_sqrt */
 #define REC_INV_SQRT_SHIFT (32 - REC_INV_SQRT_BITS)
 
+/* Cap on drops per codel_dequeue() call: the loop's work depends on the
+ * idle gap and backlog, both outside our control; resync when exceeded.
+ */
+#define CODEL_MAX_DROPS_PER_DEQUEUE 256
+
 /**
  * struct codel_stats - contains codel shared variables and stats
  * @maxpacket:	largest packet we've seen so far
diff --git a/include/net/codel_impl.h b/include/net/codel_impl.h
index b2c359c6dd1b..4d5e471472f6 100644
--- a/include/net/codel_impl.h
+++ b/include/net/codel_impl.h
@@ -93,12 +93,17 @@ static void codel_Newton_step(struct codel_vars *vars)
  * CoDel control_law is t + interval/sqrt(count)
  * We maintain in rec_inv_sqrt the reciprocal value of sqrt(count) to avoid
  * both sqrt() and divide operation.
+ *
+ * Clamp the increment to at least 1 tick: a very small interval (or a
+ * large count) can truncate it to zero, stalling the dropping loop.
  */
 static codel_time_t codel_control_law(codel_time_t t,
 				      codel_time_t interval,
 				      u32 rec_inv_sqrt)
 {
-	return t + reciprocal_scale(interval, rec_inv_sqrt << REC_INV_SQRT_SHIFT);
+	return t + max_t(u32, 1,
+			 reciprocal_scale(interval,
+					  rec_inv_sqrt << REC_INV_SQRT_SHIFT));
 }
 
 static bool codel_should_drop(const struct sk_buff *skb,
@@ -154,6 +159,7 @@ static struct sk_buff *codel_dequeue(void *ctx,
 				     codel_skb_dequeue_t dequeue_func)
 {
 	struct sk_buff *skb = dequeue_func(vars, ctx);
+	unsigned int drops = 0;
 	codel_time_t now;
 	bool drop;
 
@@ -180,6 +186,14 @@ static struct sk_buff *codel_dequeue(void *ctx,
 			 */
 			while (vars->dropping &&
 			       codel_time_after_eq(now, vars->drop_next)) {
+				if (++drops > CODEL_MAX_DROPS_PER_DEQUEUE) {
+					/* fell far behind the schedule */
+					WRITE_ONCE(vars->drop_next,
+						   codel_control_law(now,
+								     params->interval,
+								     vars->rec_inv_sqrt));
+					break;
+				}
 				vars->count++; /* dont care of possible wrap
 						* since there is no more divide
 						*/
