Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795469191;
	b=e3eEEFfKgiNdl50tBrsHrQB7dkriY0nk0iCRX34jAfJmuN8lSQZHsWL/j8Mm5Io196o2
	 1kWkKe6DxQ4uAmJbBskQTfS288WdzpcsDDigC//zyauKOxRqBZTlBGW8Dv2sz8StyeWgN
	 EasnUttE1hEIF5jjzyU/8IOTtb+hnrTPcOD7y82g/8cuwyvgzSc847oGR3rp37GAWyGU8
	 7vIqLYMtqZhcZ8R2fUY77RCP+78QK3NeZZzY31/LO+5zTnCH85HnxbqVO2htzXcvAlxzg
	 +Aaaxl2X/xBKUIFOzvg4ayM6HcmZDtZllz0lApWXLXuGF9rTmMLBohZz5iSuwWayHJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795469191;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Ys1I2/dqjY0C2V3gDyaRjkeFYxfNTPPitZA6zoLDPos=;
	b=RXZlNKOrRiz2KVYaT+rBkh5Di3KD6di38wWHHpoFx9axlTjqAAEIU93fy+bjJDiXJvGx
	 lx5GG2cWIkbwOMTNYTg7TXZrfShqAa06Zlbba6GaJmQ+lfzyA5gTySjbENO0wUBVBB0XY
	 NypOvdWnlNAKbj4xdt6WxX44aPpy6nBBJd2SupE0KeHT9Unz3xIsfqNfjPTuwWpPCpyQn
	 SYLPC3+4vFEAS31K/lQ1pkZWUciS5ejeMOEBPtww2mWslnUTuFpmy+1kyWYRthRgFlvEr
	 cKrGp9YoMfeZWmvNrGI1YzD0rJCFvb7z7zEQE5tmwEC46dLK4LtRV/R5zZxeS4DNsuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AN7VXyl+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82EE606A327
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 21:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AN7VXyl+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A29E11F000EB;
	Mon, 23 Nov 2026 21:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795469190;
	bh=Ys1I2/dqjY0C2V3gDyaRjkeFYxfNTPPitZA6zoLDPos=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AN7VXyl+RNZGjVtNGYl52k3s6w4BlqBlxtlf3H657SDV0hHwcgbhWAjRJ8rEK+5sV
	 qdjcqpgfRnIKm5SkHScIkUqqRZKboH/pQxOReEo+DVpSFJvdumIZulA92OGyF4A0vX
	 LFOM5yBokEuMjBw/LBqNMqqFgXAyeCXyxgSR8m8zMJjn5LCJkwuTF/gW9VOEzJp5wy
	 OHz9cDnLzwWSkAjcaNZMigGu6MBRoMDOORrh5HvhVqWPF3aZ4ZVoEFSo3c2iFeC3mW
	 qHah4UxBE0D2RJDMxC+QdU2D8HhvAMD4yB+MePYZ7Q6inzQ9Ynm/XdOGpMpIQQKIhX
	 yxU0yE4bqllpw==
From: David Ahern <dsahern@kernel.org>
To: netdev@vger.kernel.org
Cc: ralf@mandelbit.com,
	David Ahern <dahern@nvidia.com>
Subject: [RFC net-next v2 3/7] nexthop: factor out nh_has_f6i()
Date: Mon, 23 Nov 2026 14:26:05 -0700
Message-ID: <20261123212623.106153-4-dsahern@kernel.org>
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
Content-Transfer-Encoding: 8bit

From: David Ahern <dahern@nvidia.com>

nh_rt_cache_flush() open codes a locked check of whether any IPv6
routes use a nexthop. Move it into a helper, placed ahead of
remove_nexthop_from_groups(), so the next patch can use it there as
well.

No functional change.

Signed-off-by: David Ahern <dahern@nvidia.com>
---
Changes since v1:
- None.

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

