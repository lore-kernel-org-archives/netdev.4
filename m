Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795656834;
	b=XXi3aIliOw1G+Qo70cMjuQLePYCcCoKu/37ZET36U4T9dcvipWGsl2+/ShrPHusZY+5m
	 vttI+mSuAGDsi/Qbxdae+hIQCyenWgD1uD2ux2kn9lExR9eaEZJ4xHzbf4dPasHxagiQi
	 WGfRuj3DjJf5oxYN5M5S1+NGOG5L/qNC+AGLlP4w9fAweT+kkVS9sUfm+zZMXZET8kD7r
	 2tgYh1nOdXM4yWKA1o6IMe1eeyDxlY6PA959sPa4Pz5BzbjszN5aOnEkdwgXk4ReIeuYZ
	 Fsc+ReLy/2TmDN8DFRvVT5Je8npDlv8EOxRKuebegtkRAyTiUF/PKrRBGljOvPpOuaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795656834;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=zAN2qqoJtcSelGCw27D53NDlA0Ce0ZwWItYo5sp3gMI=;
	b=XeafsH0NaRT05gbqIYY/Tuc4HWpJipcHfywoy6U6gl5lGX0aN4E3NtSY9dGaa0580fe8
	 /cjErbOCmxOqSx0MtQAx2dsZ/TlR8P6haAt3MmCGuNjN/qcBma4poAsy9wfllWB6Ylznr
	 AFMPfOkiV9x67XvjWqbZr+Ls5cxAR5AfZqCj6cfx/jDrcvVxDeedWBlpbKG0GzWp7nEtq
	 kmPHvLAaGJFseQ0gPHNSe9j7TF5dgWiRJqDrd5pSUWr2zbShQX8RV+wSWCt9RSZqtm2hs
	 WAUEChXAHrrE4IkOdAmuwiaF/gh9azmfxKeJhFzpzn5hODIQDWbi2j/RguTFal3XSOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XujfWdDN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C50606A326
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 01:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XujfWdDN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D955B1F000E6;
	Thu, 26 Nov 2026 01:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795656834;
	bh=zAN2qqoJtcSelGCw27D53NDlA0Ce0ZwWItYo5sp3gMI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XujfWdDNT2FoDstQbqnGsKs1IKO7P6l2uFvWhERObmhTemAfm6Nsu2ceQh6gH5Lie
	 hwPgJQ5ljDxWDQEnt0UUxLKJEsLjhv6yDrtR21b2netMaWfJRsgY8jIjkfHzVweH+G
	 c/YpYzviOdRKqkOWBdU6p5N6kYnh3nzsWt8RS4ZKlEghRSD0lHyWwvcLGLVRqmcS2D
	 kL+d9+/ougLtxB540vZe7Y23TuMHJQCV2LaHVL1OzdbFwKfkByb2Z4Bl1cBCT79V7w
	 B21JGKMoRbBweaz7I1fdoW1xO5oAMz1wBR20MRRvpNgM8pPvfWT1dLmP+eF8/cL2E5
	 icAH/aPRfYtDw==
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
Subject: [PATCH net-next v2 08/13] nexthop: factor out nh_has_f6i()
Date: Wed, 25 Nov 2026 18:33:34 -0700
Message-ID: <445f336e64d9d09682c9c9d5cd01d2e6ac290004.1795642432.git.dahern@nvidia.com>
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
Content-Transfer-Encoding: 8bit

From: David Ahern <dahern@nvidia.com>

nh_rt_cache_flush() open codes a locked check of whether any IPv6
routes use a nexthop. Move it into a helper, placed ahead of
remove_nexthop_from_groups(), so the next patch can use it there as
well.

No functional change.

Signed-off-by: David Ahern <dahern@nvidia.com>
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
2.54.0 (Apple Git-157)

