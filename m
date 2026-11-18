Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795033847;
	b=ulCprx3qlQVgJw1ultDIypDeW1q6z2+i4mLHnXuL4mAXBixkrbllfEtsRKoCU+DGHQek
	 f/ylDckYB+jUqyvKirvF546yIYJLJ5zBeLyqN7A7kjCt/nXzMkYOq6bRP2aQc9S+/2JYl
	 epNVfpbJreNgLgLveFCgQIPPkJygGYjUFMxoN4gSOeIJO+EatAhvIaEpHZo32x2HsI7M3
	 JWrWzH0hVuu76Uy6tvxa9wS6WKkfiXignyAYUqcPGe8O79i2H5ECiSuMabXGB4zqyMtVK
	 ZZL0sU6oDzmar9UtRL1Fe2liARVR1PIw+Z1hIr9EvcR8M2Rl7+VpxCFd+EFnCRKcC1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795033847;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=FB+aIq8L1fmrLNyEt2DjQ8jj7Py87jZZnAJlxx914mE=;
	b=BkFdeVriaR+CTx5CZOMEvY2Y4mQ9dadM+gXR7L3RHMbx7ZcO5ZimVvn6LXmYyPjUlaiq
	 rnOJ850Vva1SvoeuplTl4w6SF14a2IEIYFGMxgWjrpDl9un9quvz+iZt1DJGtynIfoKzL
	 5i0dCuak8dDTfkenZqs7agBP3iPWDx1DwjvZdkEf3VQg5uUlckZ2FsU6xDeRuIJoJEqYy
	 2GWhBI+xKJ3VbGbA0y1+YVRMIsPkdS9BXYrAW4sIDIBFGgyfsprkCdpS7FxV70JcruCUe
	 n71TtDzCRyksFRGudcPUKrBt+aa3u/gruvN03JnlkZZMxR8sm6Wtarp1wsqUrqiROAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eSsG6kSH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F99606A336;
	Wed, 18 Nov 2026 20:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eSsG6kSH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22D3B1F000C6;
	Wed, 18 Nov 2026 20:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795033847;
	bh=FB+aIq8L1fmrLNyEt2DjQ8jj7Py87jZZnAJlxx914mE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eSsG6kSHVdjL8VGjI52bmfsguH1k2D2tE8rUPZsEuc5sMWFXlBtNyx31kZAxhaRgh
	 lMCjLKSDN14yjKGfI3a7LY4dEro6QJ/BzlYS51phOWn9DIxhyQEiw904CoxpKzT5JF
	 ciFPUxDLypaelxzj9y+J2d2bb1SzTtnzuT2TpMfusCa8Enf9MMLXpdcM/nniZvPNGJ
	 BrJpS9aavLZylCZrCY6uMUfmmnRmZwu310tGxh5NLNzZiAtKPwsV27Pkr6ToYy9nJ8
	 7iuQXm4DGKMf/0bqs2K2N7hr6v9tEYPbwjYdfZYw1v56BYedLAXvRXcGqnSB2Z1uJr
	 x5vto8RcdZ3Mw==
Date: Wed, 18 Nov 2026 20:30:42 +0000
From: Simon Horman <horms@kernel.org>
To: lirongqing <lirongqing@baidu.com>
Cc: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-afs@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] rxrpc: rxgk: Fix uninitialised stack byte leaked via
 RXRPC_CHALLENGED
Message-ID: <20261118203042.GR860048@horms.kernel.org>
References: <20261112114305.2340-1-lirongqing@baidu.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112114305.2340-1-lirongqing@baidu.com>

On Thu, Nov 12, 2026 at 07:43:05PM +0800, lirongqing wrote:
> From: Li RongQing <lirongqing@baidu.com>
> 
> rxgk_challenge_to_recvmsg() builds struct rxgk_challenge on the stack
> and passes all 8 bytes to put_cmsg() via RXRPC_CHALLENGED, but never
> initialises base.pad at offset 3. The struct has no implicit padding,
> so this byte contain leftover kernel stack data and be exposed to
> userspace. This issue was identified by code inspection.
> 
> Zero-initialise the structure to prevent the potential information leak.
> 
> Fixes: 9d1d2b59341f ("rxrpc: rxgk: Implement the yfs-rxgk security class (GSSAPI)")
> Signed-off-by: Li RongQing <lirongqing@baidu.com>

Reviewed-by: Simon Horman <horms@kernel.org>
