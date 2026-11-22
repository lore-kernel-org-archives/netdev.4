Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795386445;
	b=5rlo5S+h2toAWE8klvyHMp0UKkKMQxmnvXp3CWEvVyegP4IPxSuzBthxt4UlEWIdBpaM
	 c44f1hJCgoEIH7UTtYWDAL16aEInvzhnvk0Rne2l5m7TGfvoFVZF3sHjpTTnPwF0hgMxI
	 KBVtRhSc2DnHG4+RiphwuMsl4CbiYokYb8vKItVYH/Lm4cWftKswJGDbR4wuRy9yGG/OW
	 jWhTaMT/2jx+zvrDtYCE1OwxLlgoWNJa2npE0ccpwG+ujOU+WRq5befWFlJoU/+0weFUF
	 HVWtmtF39SKJ2ZcBc3GnRUYRA4g6UhvSMAp8jFi9lMylFIINv7n2RdxRbOaxV4OgHXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795386445;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=2WZffXl3jyJwMwq1Py6aVFOiURpXuHsFngoCMEWO3L8=;
	b=BEWiFLTl1kt+KkCB3dD/h8VXhG2wk/nlEP9BbOqT7RPSXuPtpEQ/riFsJ/ejQlfLUnTO
	 NM2kOW8nEPmLIAcD3BgiAP6ZAYHyfw9fbzSweKgFeGb/in0PHI4IKvks2Con8u3dw982A
	 Si9X/B/OqVBMJDJwinJLoqpGtoWwncw2uxhHWgF2AJBi8Rn/FnqLamSGinTvyHFSm1YZR
	 QpmhKuOYzg/VIg8Xl6lnN3V7by4jh6gSm4oyuCsxUW9q5N0jPZHKAHwcGikX5qVR+2P98
	 eAey98H4vkzK17sfBJIhpBqqCf88nIZgeCUNxcAb3Dx+oNFx/vPSrU/fbirTDry31ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i+85ME+L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7092606A31D
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 22:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i+85ME+L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 140801F000F2;
	Sun, 22 Nov 2026 22:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795386445;
	bh=2WZffXl3jyJwMwq1Py6aVFOiURpXuHsFngoCMEWO3L8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=i+85ME+LacJSbtEWCRFts2exPWeFai6+QxAaMLYyfsrDnSsBsgWWp3mXam9Hljg+y
	 TtyFRMNLwG5tcGUb38nhnJ5ftGeKhbBROh0VWOHeRdNlyFkK+fWIcIPkNcaPg77bsH
	 CXISjIxGAs30yplOI4TM67stKPY7BOZCffG1Id7mqp+vYNZm1+Z4wCGekLfvku5xqJ
	 iHyNziIfjSAm1/z5kENMYFN2xXXGC+JkBa0uGMT4xYFdar0kzilV9FoyGrzxfDfmWl
	 eluseu0zxVioCOF7a/towZcroBsN5EnX/KXqhNpyS/homh4ETBWCv2X6l3O1COBnA7
	 BtXltMCHBXqdw==
From: David Ahern <dsahern@kernel.org>
To: netdev@vger.kernel.org
Cc: ralf@mandelbit.com,
	David Ahern <dahern@nvidia.com>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	"Claude Sonnet 5 . 5" <noreply@anthropic.com>
Subject: [RFC net-next 3/6] nexthop: factor out nh_has_f6i()
Date: Sun, 22 Nov 2026 15:27:01 -0700
Message-ID: <20261122222717.126333-5-dsahern@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122222717.126333-1-dsahern@kernel.org>
References: <20261122222717.126333-1-dsahern@kernel.org>
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

From: David Ahern <dahern@nvidia.com>

nh_rt_cache_flush() open codes a locked check of whether any IPv6
routes use a nexthop. Move it into a helper, placed ahead of
remove_nexthop_from_groups(), so the next patch can use it there as
well.

No functional change.

Signed-off-by: David Ahern <dahern@nvidia.com>
Co-Authored-By: Claude Sonnet 5.5 <noreply@anthropic.com>
---
 net/ipv4/nexthop.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/net/ipv4/nexthop.c b/net/ipv4/nexthop.c
index 42e55b5a755e..53431fe7d328 100644
--- a/net/ipv4/nexthop.c
+++ b/net/ipv4/nexthop.c
@@ -2109,6 +2109,17 @@ remove_nh_grp_entry(struct net *net, struct nh_grp_entry *nhge,
 	return false;
 }
 
+static bool nh_has_f6i(struct nexthop *nh)
+{
+	bool have_f6i;
+
+	spin_lock_bh(&nh->lock);
+	have_f6i = !list_empty(&nh->f6i_list);
+	spin_unlock_bh(&nh->lock);
+
+	return have_f6i;
+}
+
 static bool __must_check
 remove_nexthop_from_groups(struct net *net, struct nexthop *nh,
 			   struct nl_info *nlinfo)
@@ -2248,16 +2259,12 @@ static void nh_rt_cache_flush(struct net *net, struct nexthop *nh,
 			      struct nexthop *replaced_nh)
 {
 	struct nh_group *nhg;
-	bool have_f6i;
 	int i;
 
 	if (!list_empty(&nh->fi_list))
 		rt_cache_flush(net);
 
-	spin_lock_bh(&nh->lock);
-	have_f6i = !list_empty(&nh->f6i_list);
-	spin_unlock_bh(&nh->lock);
-	if (have_f6i)
+	if (nh_has_f6i(nh))
 		rt_genid_bump_ipv6(net);
 
 	/* if an IPv6 group was replaced, we have to release all old
-- 
2.43.0

