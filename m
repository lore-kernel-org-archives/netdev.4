Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.94
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096552;
	b=ZVUJLpRIj77HDiLHFaCTR/6y/4tiVeCVUp3KwPP6twjpsltR86PHn8F2Pp/Xlom0rEp0
	 v6ZZJAzfAa4Lj7HtIKZk3zUF7Li3pZjHYSim9mdK/wGbXL/Ci5ehvjJM3T0/ezuMgir9v
	 XPjo1BDhCR2W8sb1Zykt4Epe96R7c04iB30VlWRPadusWGx8ZRqhKdOWEVySVhWkSNAEj
	 LF5CKmvIg5H/APCsro5d/jk5Qrjsi8f+5PwmtZEwa+RViYciCA9rTjwP30/apqZn6487b
	 u0S7He63t8c/ob814hrHZhpxr5U8BNrT/gTIzMlLFboEyQOR+bR6fvjB7ErgkyBzXcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096552;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=Oh7pEweTka3zkQsRuXJERHa5bAXzxW+yDE0QBxnaa64=;
	b=3973XSkeUnwIT2v3F6b18I8r53TR84sMRdpKNyDhQLT+PDFyhsKnZQd4sAk9QoMkmotq
	 aj4qlVBX4nEgbOqUf3BQ1PlgdL252f2g64ziAWyCPCTiSF1o8HGKhNOukACcWEQ6gnTzC
	 HsoWTu8upQs7vh3rSnIshd2XipPvAUh40Rrj3L+a5CGXWEXboKcGh/k095rMAJ8lXTFVR
	 PVmiaWdQyC+P8/l2zR2wu8Cq0vfKMq95BxTv5YJdUOAIqYVPe0gg7aRBMH2CeUTHGi1St
	 6UyEtnTXO6FNmnpirMD7EfDO4Ks79NxODCsYQkH/QNKKeJL3IUgHhNA1tzAWlF+EPWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PPIlOG7E;
	arc=none smtp.remote-ip=95.215.58.94
Received: from mta1.migadu.com (out-94.mta1.migadu.com [95.215.58.94])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A77606A324
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 13:55:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7A77606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PPIlOG7E
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7opVJAHK0m5GwSlc4qZV3y00qwxR2kUqAzycyzdxJUA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795096549; v=1; x=1795701349;
 b=PPIlOG7ET5TwjZksD7PrJ8+DkyyfVP4Wdwzoaze0WA/1ZKJE6Cc1TdQACHk3vDIh2avdKarR
 lr0zUrlZSsJ7gsWgMlNxxfbmzu3B3DDxfgrtHDHGL2gi2yLyQz8nIFxW5hPQAUNLlmpiAFX4OW+
 Chb2g/9eZ0a98PtecpLfvN/w=
X-Envelope-To: netdev@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id ebd9ad4d2a421d3f;
	Thu, 19 Nov 2026 13:55:49 +0000
X-Mizu-Trace-ID: ebd9ad4d2a421d3f
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Thu, 19 Nov 2026 21:55:17 +0800
Subject: [PATCH net-next v4 1/5] seg6: split final End process out of
 flavor processing
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-srv6_flavors_endx-v4-1-284cdb484eee@kylinos.cn>
References: <20261119-srv6_flavors_endx-v4-0-284cdb484eee@kylinos.cn>
In-Reply-To: <20261119-srv6_flavors_endx-v4-0-284cdb484eee@kylinos.cn>
To: Andrea Mayer <andrea.mayer@uniroma2.it>, 
 Andrea Mayer <andrea@common-net.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Hangbin Liu <liuhangbin@kylinos.cn>
X-Mailer: b4 0.16.0

From: Hangbin Liu <liuhangbin@kylinos.cn>

Move the final End forwarding step out of end_flv8986_core() and return
success to the caller instead.

Currently end_flv8986_core() performs both RFC8986 flavor processing and
final End forwarding by calling input_action_end_finish(). That couples
flavor handling with the End-specific forwarding path, which makes it
unable to reuse the same flavor logic for other End variants.

Split the two steps so input_action_end() does:
  1) end_flv8986_core() for flavor processing
  2) input_action_end_finish() for final forwarding

This keeps end_flv8986_core() focused on RFC8986/PSP flavor semantics
and makes it easier to plug the same flavor core into End.X/T later.

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
 net/ipv6/seg6_local.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/net/ipv6/seg6_local.c b/net/ipv6/seg6_local.c
index f71e47b5e764..65d552f87fa3 100644
--- a/net/ipv6/seg6_local.c
+++ b/net/ipv6/seg6_local.c
@@ -885,6 +885,9 @@ static struct ipv6_sr_hdr *seg6_flv8986_get_srh(struct sk_buff *skb)
 
 /* process the packet on the basis of the RFC8986 flavors set for the given
  * SRv6 End behavior instance.
+ *
+ * Returns with skb freed on failure. On success, the caller must complete
+ * final processing and forward the packet.
  */
 static int end_flv8986_core(struct sk_buff *skb, struct seg6_local_lwt *slwt)
 {
@@ -945,7 +948,7 @@ static int end_flv8986_core(struct sk_buff *skb, struct seg6_local_lwt *slwt)
 		goto drop;
 	}
 
-	return input_action_end_finish(skb, slwt);
+	return 0;
 
 drop:
 	kfree_skb_reason(skb, reason);
@@ -957,6 +960,7 @@ static int input_action_end(struct sk_buff *skb, struct seg6_local_lwt *slwt)
 {
 	const struct seg6_flavors_info *finfo = &slwt->flv_info;
 	__u32 fops = finfo->flv_ops;
+	int ret;
 
 	if (!fops)
 		return input_action_end_core(skb, slwt);
@@ -970,7 +974,11 @@ static int input_action_end(struct sk_buff *skb, struct seg6_local_lwt *slwt)
 	 * information extracted from the packet, e.g. presence/absence of SRH,
 	 * Segment Left = 0, etc.
 	 */
-	return end_flv8986_core(skb, slwt);
+	ret = end_flv8986_core(skb, slwt);
+	if (ret)
+		return ret;
+
+	return input_action_end_finish(skb, slwt);
 }
 
 /* regular endpoint, and forward to specified nexthop */

-- 
2.56.0

