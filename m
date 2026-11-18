Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794970145;
	b=IZBup/7EjhhFdNK0L1QDi12Y5kCeMZsBtr3Qpbh2nY8CY01cBHHLRDKAhsV34hfJKJUz
	 nwMPhBpMo0Tp0qJCVyPyp0J3MQwhzcHd3zc9LRMVDtCGYXqiqpfgL3qCBYhN4NkrNjmH5
	 2VUiCS+svRZqpzHKWMZ/yaSJFkWnhUDPuTfNcc+BO7pfl/uc5JXlZbNKFbzWnbgOr9l63
	 hUUvWaHpXlpKLkX4sbjPB8cIheEdeEiS7C4fLecrOFW2zqq0UrSQ2dy5ZCJeXvpNJyGQ4
	 MRJlFuFDIPMFuwWDKbmhnzz1+Ki90yt0nHwWxF8I04MaG+oERezUltRs72xuSzz0XJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794970145;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=EVOtJpQwTiAQVQnsFtibBq2l8pCpTRdo9LTRwC5W+Og=;
	b=a1FdOvjI3MmucG8vnqd4OzRk4B34QuE2ES7LnPG16OuZGmFKMoZn5p2UIY6TnwOVCE4V
	 DF4vMifx7WgxRWFUEomKLwzzAj2CTjVhYZkwix68OdZwqu1pF8IATrvKZywQOoWNJ+dFM
	 4RLZriTuXN0lMYIxRj7FPqrC0L9Oxx/YgCaGIwrh9UjtooX9pheeUGOPTmhn1ga9ELvp1
	 jcVngFY6QgG82FUymFxO3jWl1Pm6u//vyB9BnC/0E2fD2VtCNTXho4NDxDnTIT9+WWziI
	 QCGU6odtntvZmsE6ehSGXpb9+YUd+M9/52zk/ZUnE7dxE6ulHjEktC6PCtttVO9KMvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BWN5MNIh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B7E606A31C;
	Wed, 18 Nov 2026 02:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BWN5MNIh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D57FB1F000C4;
	Wed, 18 Nov 2026 02:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794970145;
	bh=EVOtJpQwTiAQVQnsFtibBq2l8pCpTRdo9LTRwC5W+Og=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=BWN5MNIhnglNbztJoWbdLni1gYxdqutqfFdqOiGCLSMDEVjq+cPq8x7ucBg/7AC6S
	 gLEU947gUtAL/XN6gwcLddmJ8MPnTBU7DMPVf9fr9SAAP7tVK8creTntXSRJJG95DB
	 ZZLFmkrBtJS2C232h3RVWeIFeViO9WZehElISwjH3ORYdAwylPmCVCC4bQK+9ri0lm
	 vnOYBWjnHMvGfAUB8088dp1XsWNhYvbP1CrgTPBosCGYKYXj5aiJGTFoz83OxwmNgT
	 ZUJhowO19pjkcJXbfXpLH5H/76FZhPLHbek7fNSGLyw3a9B0V6toG17VuEpvRw++gC
	 LwDdg6t54ht5w==
Date: Tue, 17 Nov 2026 18:49:04 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Linkui Xiao <xiaolinkui@126.com>
Cc: maxime.chevallier@bootlin.com, andrew@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org,
 devnexen@gmail.com, sdf@fomichev.me, 2022090917019@std.uestc.edu.cn,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Linkui Xiao
 <xiaolinkui@kylinos.cn>
Subject: Re: [PATCH net v2] net: ethtool: phy: warn about a phydev with no
 link topology
Message-ID: <20261117184904.27187edc@kernel.org>
In-Reply-To: <20261112075517.3904496-1-xiaolinkui@126.com>
References: <20261112075517.3904496-1-xiaolinkui@126.com>
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

On Thu, 12 Nov 2026 15:55:17 +0800 Linkui Xiao wrote:
> phy_prepare_data() reads reply_data->dev->link_topo and dereferences it
> without checking it:

defensive check based on a hallucination, let's not
-- 
pv-bot: slop
