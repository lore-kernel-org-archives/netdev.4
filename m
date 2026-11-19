Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795048008;
	b=ddMVD4jY3hbqBqBU7xJRN3+JQlBU5d87z40NWyEAd23DfwvccEp9qW+8sdOuMf3LaOpk
	 oIURCB4zHQG8ud/npvfAywUAItvVp6CfKR/5YFfEfe0LmYZVUk/gW3dNT+2Q334ytbz6R
	 STDzGrhMjLnK+hY8H2j1gApTUkMcH2Z9NxTeSwB068V7tPI/PUXy/eFU+UwrZvdKIbAnn
	 Lh3vWPtzJPnosluB9AvO6Gq669FXBUiODxaC9nn7ZVmg2XR3zb0SMOmkbggGDvcjDiiAo
	 QeL6Xtu1+aHX5r3dSzeNa7o/Lv1sdD+5rA1fBSn/I1C9bpdcjJ8PK8DtjR8taVrCiVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795048008;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=zUHHRIOykuOp9fZYb2g96poJ3qG0xhL6Zvr6MIjJiZo=;
	b=UDp0lcb3hSRFTHNHzbWq89mIVP/d+jtXanAZJ6fEjtucZCNqsVvxPIAAJytTvfVyGVMB
	 wSmWQysVrzlWYTlb++BbG0s0XKqAtBWkI6UbAVvygfmDoR+7bzA2YUIMRlYZp0BJ0Oo9y
	 1Pg4Efc8/yICqUzcUBCzxPXwHu2krpPdVt9OPkBCpm14wXRq6s0KjhTkaWs5TSQyB2yfi
	 jf7jE5kGLI7ybreQsl7MwKFn3s+xQerMEPB0adYKeeF77UNz3qNgGe8eSAG5pxwWfFlXB
	 Q6R94QgQZT6ytac/chNkf6HeO6YUrfb8A9OisrplKkC/5nXidaYk3GsFAONKEm0nhLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zj0F2EIg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A06606A325
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 00:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zj0F2EIg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DD661F000C4;
	Thu, 19 Nov 2026 00:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795048007;
	bh=zUHHRIOykuOp9fZYb2g96poJ3qG0xhL6Zvr6MIjJiZo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Zj0F2EIgtnYKGnKDOBg8tn88kSxYhIfJSeMoqswnD7OXWoGyulWld+oBA+JlXikyt
	 1ea8IAHCVlfdU5qCUuH7p1Uwf6pFONOibur+1pIgNrYCj8xuXv+b226dAreRocyCx6
	 wDJ3K1W2nVcW8NGfg8J7/H6p9gwwe/FZHZYxyI2ciCQNo+3fqXgZghquHOHVnLISnQ
	 D5nac6i5/sZpTXntMMTPLo0dj6yyTETAbiuI48GtHKmZyvEPjdCs6l1ewlY2mhuMJC
	 I/8+ClmVtyFoiekk3GdL0PWIpRH8F0SCAuH2zF5i4MjORuKxC9c5UXFA8cjarZniej
	 L0Z0sQF9k37kw==
Date: Wed, 18 Nov 2026 16:26:46 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Minxi Hou <houminxi@gmail.com>
Cc: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, Aaron
 Conole <aconole@redhat.com>, Eelco Chaudron <echaudro@redhat.com>, Ilya
 Maximets <i.maximets@ovn.org>
Subject: Re: [PATCH net-next v8 3/3] netlink: specs: correct the ovs specs
 where they do not match the kernel
Message-ID: <20261118162646.688c68c2@kernel.org>
In-Reply-To: <20261115072638.3163018-4-houminxi@gmail.com>
References: <20261115072638.3163018-1-houminxi@gmail.com>
	<20261115072638.3163018-4-houminxi@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 15 Nov 2026 02:26:38 -0500 Minxi Hou wrote:
> - * For other requests, if %OVS_VPORT_ATTR_NAME is specified then it is used to
> - * look up the vport to operate on; otherwise dp_idx from the &struct
> - * ovs_header plus %OVS_VPORT_ATTR_PORT_NO determine the vport.
> + * For requests other than new and dump, if %OVS_VPORT_ATTR_NAME is specified
> + * then it is used to look up the vport to operate on; otherwise dp_ifindex from
>   */

AI points out this comment got cut off mid sentence
-- 
pw-bot: cr
