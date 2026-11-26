Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795656836;
	b=yZIya5tPqr8Vy9yG7J6ec2BhBdlAdyIi10gYigazkkk5rOGz14uwWbtQyI1v3uNPGK6Y
	 VEz1Beo6Et+EY+z4l+aYJq1KreE2gwAJqdhFgBqHtdquP+cAgpOSNKUbatjjcqQO+GqiF
	 LRhZ/+ryoIlSDxDVIC7KGKarax5gU3lFvmxa5m5ARxIRzf6rfWPtSQe/EQUVYJrgENZ7+
	 r4mWRdQzxuvfsaZseLkJD5X4tvpzIYSdzmVlTfl/IToA6QnTPom/rrWsTnIVIg9Z2D1qt
	 Lrm44UTz5PcMa092CKC9B2PX4MsSok6cjZ34PNlNXPJ2WSFlQsO/2aULGt1LUEa9fNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795656836;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=9VyDZEv23BvcX7vVp78Vi/R/LVAtah78Cem9kFMvUnA=;
	b=jUrfbmM2Bs49yVC+pPT66XymAHJ85Jh3T3WP9Ppp/Ugv4r2M03P1wt7vK66EOqmyJuNg
	 6EmY+0V74HtyRR0AjiPKsqFVviwwx5xHsveBfVj+M0v8jvAYxOdJPiNdg18R4+lNGtW/a
	 PP8a1eC2LfUCjiZoaUnqMPohGFkOOZ+irgNi6MgqULb2c1T/ersSiiSFxIArdQb5vkqhv
	 0ku5xFlRql/DE4+tNeOAXBe4oWeqVdKrm5Zon5UcW2hjzJT4avalw/oMnzF0RnFE2+Yce
	 Qs6LRGu24QE3k4UMUlo738REbXeed2OAyopvznwJfW2pbV8S2zer4E9pgtmNKt2FRvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="g5/PeLPd";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDFF606A32D
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 01:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g5/PeLPd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AEEC1F000D4;
	Thu, 26 Nov 2026 01:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795656835;
	bh=9VyDZEv23BvcX7vVp78Vi/R/LVAtah78Cem9kFMvUnA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=g5/PeLPde9tCgraBxPqIidaCCykxokG1Om3bZhfud0FyIOjPqK+q4xMAPBvqZnlrE
	 /IFQDt7GT/uyswwAH02jwl476PmpB3av4G+C2NGzKBzd4FYlicurpbibbqsTQIpVJA
	 rU/ZRAmZqqM72tUthglquNjjLBMG4DaWfudRoqmBRsLv9Q6YMSWotpASJC/3LpMkV3
	 KtiFH9mGVXW1/2pCtKK9Mpx3NZZ/Hzm3G7aJKRcmhWtVNYLSvUp7mmDQFGntyEu95B
	 WYN9o6j13N6Whg/pXOFOm8HQy9Dq/60s2YCBtsb9oYqLYTl4XCXw8pOAAQf19zfnOn
	 CCkWzflEqM7Hg==
From: David Ahern <dsahern@kernel.org>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	ralf@mandelbit.com,
	ja@ssi.bg,
	David Ahern <dahern@nvidia.com>
Subject: [PATCH net-next v2 09/13] nexthop: bump the IPv6 route generation on group changes
Date: Wed, 25 Nov 2026 18:33:35 -0700
Message-ID: <09d703171e31f488d7015349516203e8196ba843.1795642432.git.dahern@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1795642432.git.dahern@nvidia.com>
References: <cover.1795642432.git.dahern@nvidia.com>
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
2.54.0 (Apple Git-157)

