Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795469191;
	b=AkRETkfwSXAwFhqzIVg5yAAeMy7Y/s9Zre3qO0gBgKxLTh34jR2cJlSOl5y4ZJUDgFeD
	 0zTjH0nI3GXoRUPTBP1RoAMfSF4B0BGoKAP8MyimLA0GL5z2ybYE42QgkarVB+4Tfy2MJ
	 5drHgZ2pweQH9/PUkLohmI+tEV33DVvwbmFa+S4Dl/+6tW8HXv5sC4lArzmzCri5fXn9m
	 +xqaYMbzrr4/N6s0luFundr/FhC+vJLDDxjjx7VirOnzv8XSFebZaT5TYQfggQNCJB1xy
	 +Tx4yLMFRUKMWjSQDnRvQWLHshGWBTEfjqHwfPew8QUGMyb5442p4W2Rt5a9GuX0Bnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795469191;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ivyQkRikRive9LW/MxJ4L5A8kdukFsnKV4O0WgPaXnU=;
	b=Xl4JiAXOiaTwXZc8QH64tbbIA/FGHJHoHlwNJxIbz38SFFn+UnwHSu8OgruyMXH5P8TA
	 odnC+FxbSn8xqM36prPPgKO2lI8FbeAJFa9Wy2HcE1QuyiethV914zUGysnAB79lv6I5Y
	 MmKg4M6qSWtmvoKPaWF65ToJq6XB5r3uZtbKF9xTnd6ngCvQbLKPtXojo7wKWniw25XOB
	 XEG5WRVFwzFntE/F+iyf7OP5+T1oxSPdFDDGSktwTTboVmv3sc+jNDXIrlBCyPxFu+ZBW
	 KmEEFXsbGSHiDQDlm2bOCRRJcXeSmgDarI0AwUlhsidpIjN5F1BX7QkkN7qs6ZPnh1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iLIKwPip;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE64606A685
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 21:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iLIKwPip
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE771F000E0;
	Mon, 23 Nov 2026 21:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795469191;
	bh=ivyQkRikRive9LW/MxJ4L5A8kdukFsnKV4O0WgPaXnU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iLIKwPiprtSDNtFBTaf8afaiJ9l8V/RUuDrG8Taw4Hv2uzqQTTtEJSp3girSEheG5
	 twqnNuKBijKEs1qImib/ghrdxJ1DHAHZjZCUGDnhBpndwUBSKYJc6p9Cc7qdrsIZ6u
	 ZHm5/KHMlVx2H0GyeNJSXVcOo9E3sKHsGvWHBzQy+kTYJ/TAFS6Iord6SbH/3rXYgW
	 3HDuDHcB23fvckN904zPBObD37dI06TMBwjtaOSZ1ardhp7ZIO7kYIO5N9Eh2uc+HM
	 Dxa8MsQoGs22dl+7NuCV4lYTNsoIXpwhgqA1SsM9lzDvXZvgTMgHaD2xOdf67ma73i
	 NTAmJi1sZ/Cdg==
From: David Ahern <dsahern@kernel.org>
To: netdev@vger.kernel.org
Cc: ralf@mandelbit.com,
	David Ahern <dahern@nvidia.com>
Subject: [RFC net-next v2 4/7] nexthop: bump the IPv6 route generation on group changes
Date: Mon, 23 Nov 2026 14:26:06 -0700
Message-ID: <20261123212623.106153-5-dsahern@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123212623.106153-1-dsahern@kernel.org>
References: <20261123212623.106153-1-dsahern@kernel.org>
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

From: David Ahern <dahern@nvidia.com>

IPv6 dsts are invalidated by bumping the netns route generation, but
two nexthop object changes did not do so:

 - Replacing a nexthop that is a member of a group only bumped if the
   member itself had IPv6 routes, not when routes used a group
   containing it.
 - Removing a member from a group republishes the group array without
   any bump, so dsts built from the old group stayed valid.

Bump in both cases when IPv6 routes use the nexthop, directly or
through a group.

Signed-off-by: David Ahern <dahern@nvidia.com>
---
Changes since v1:
- None.

 net/ipv4/nexthop.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/net/ipv4/nexthop.c b/net/ipv4/nexthop.c
index 53431fe7d328..7cf496589f4f 100644
--- a/net/ipv4/nexthop.c
+++ b/net/ipv4/nexthop.c
@@ -2120,6 +2120,21 @@ static bool nh_has_f6i(struct nexthop *nh)
 	return have_f6i;
 }
 
+/* true if IPv6 routes use @nh directly or through a group containing it */
+static bool nh_used_by_f6i(struct nexthop *nh)
+{
+	struct nh_grp_entry *nhge;
+
+	if (nh_has_f6i(nh))
+		return true;
+
+	list_for_each_entry(nhge, &nh->grp_list, nh_list)
+		if (nh_has_f6i(nhge->nh_parent))
+			return true;
+
+	return false;
+}
+
 static bool __must_check
 remove_nexthop_from_groups(struct net *net, struct nexthop *nh,
 			   struct nl_info *nlinfo)
@@ -2127,6 +2142,7 @@ remove_nexthop_from_groups(struct net *net, struct nexthop *nh,
 	struct nh_grp_entry *nhge, *tmp;
 	LIST_HEAD(deferred_free);
 	bool need_flush = false;
+	bool have_f6i = false;
 
 	/* If there is nothing to do, let's avoid the costly call to
 	 * synchronize_net()
@@ -2134,13 +2150,19 @@ remove_nexthop_from_groups(struct net *net, struct nexthop *nh,
 	if (list_empty(&nh->grp_list))
 		return false;
 
-	list_for_each_entry_safe(nhge, tmp, &nh->grp_list, nh_list)
+	list_for_each_entry_safe(nhge, tmp, &nh->grp_list, nh_list) {
+		have_f6i |= nh_has_f6i(nhge->nh_parent);
 		need_flush |= remove_nh_grp_entry(net, nhge, nlinfo,
 						  &deferred_free);
+	}
 
 	/* make sure all see the newly published array before releasing rtnl */
 	synchronize_net();
 
+	/* a group lost a member: dsts built from the old group are stale */
+	if (have_f6i)
+		rt_genid_bump_ipv6(net);
+
 	/* Now safe to free percpu stats — all RCU readers have finished */
 	list_for_each_entry_safe(nhge, tmp, &deferred_free, nh_list) {
 		list_del(&nhge->nh_list);
@@ -2264,7 +2286,8 @@ static void nh_rt_cache_flush(struct net *net, struct nexthop *nh,
 	if (!list_empty(&nh->fi_list))
 		rt_cache_flush(net);
 
-	if (nh_has_f6i(nh))
+	/* dsts are validated against the netns route generation */
+	if (nh_used_by_f6i(nh))
 		rt_genid_bump_ipv6(net);
 
 	/* if an IPv6 group was replaced, we have to release all old
-- 
2.43.0

