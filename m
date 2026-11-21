Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795226066;
	b=M0u4Cq0hs+5yV3b6wgzVyWJR4Qb09P83ETBd1NkDPtsfE1ohh1DUgEmB+9ebLMZWd5eU
	 yvVRYfsPhpvAJqGolC641LdA3+zl/tA7MJA/J0eeYxAPfy9vAErFiJs00A4Qq4V9fHH3L
	 yq1exKzXtgP2u8uUECXvk5q+D8Rb4bFIM3/HGcLx0peNSHe2hFiFMAhG/xvS3W0j3NCzs
	 VADFCQHhxcDBtouGrqcEzyabyG5ZGWPr2aW5oeIq5gbE8ak2mprfLA6RTvRP51nLaoa5W
	 dSLtun8N28VceYRjMoGz1XLpEPY2tMgqLEqTQAWL3tzWMqqZiDweD4+5K87B2h3rbtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795226066;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=QRDvN7zN2uLD2qDn7l1jpDByyFGWvyTq5EZT6tn8lHo=;
	b=HkAPMEDWj4sGKat1sxoXa5OGjMB73rEN9st2rbB6gZ9QyU70oEsR0AOvJtFGz0ZwMZ2i
	 7oG1z7bZkmNzygMlE//jw6cn7ZG0C8CH15lQcbJgVrRPfL+4Tn35A6s5Qnaq7IDzkISmO
	 LGELUYNdcTztb4C+xkFrL5pw7Hl9WKrbtiT+8Fym3d75+H7ufhD9904/Ta8K43jPB+8Ue
	 WNtEAO0vNF8btSL/d1SbcQhrTo1pzlJuure53bqg0jVu8ML990n+z+A3Lde7nVrd5oUIi
	 n5uRmWKgL2eT0Kf6hmZiWJ9RwKzQ3kWKFq5vqBpK8Wf6cQsMKk7wFbp9AvAgpsopJ2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GVGHuTyv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F68606A69D
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 01:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GVGHuTyv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B3FC1F000D3;
	Sat, 21 Nov 2026 01:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795226065;
	bh=QRDvN7zN2uLD2qDn7l1jpDByyFGWvyTq5EZT6tn8lHo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=GVGHuTyv7Q451bG7dVI+hR2HWZl+NWR1+rWGlJ1jUi1g9ssNoEd5TpxUCTqpORnBJ
	 gEs/dU+fExDN/CciJBVmtAnmh0U/FUEb0fiU80RF2jK+LxpL3WAMkhwChTk8Syrees
	 uI1GEwf//vpxIuVf286GEHwemqnfTZyH8v3y9JxEtxjRrPmCkJ5jhCpmcsRB+2uGmC
	 AenCK8yuCnHrSWnK5PhoCTUuYwq+UpMxxllSHtQ18fGfGXKQya0gdN+GfnoO+l/SiG
	 OICcEtA/mQ1d3ysUeWHvZYZO6iM3Vmah0EDM7pQaMOQGD+3+OL3HUyeZjI+OZg+DFJ
	 CnjLXc1T7IkgA==
Date: Fri, 20 Nov 2026 17:54:24 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Eric Dumazet <edumazet@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>, Paolo Abeni
 <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, Simon Horman
 <horms@kernel.org>, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] tls: wait for a single RCU grace period in
 tls_device_down()
Message-ID: <20261120175424.0c0403d5@kernel.org>
In-Reply-To: <20261118224758.1617869-1-edumazet@kernel.org>
References: <20261118224758.1617869-1-edumazet@kernel.org>
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

On Wed, 18 Nov 2026 23:47:58 +0100 Eric Dumazet wrote:
> tls_device_down() calls synchronize_net() for each offloaded context
> bound to the device going down. As this runs from the NETDEV_DOWN
> notifier, a device with N offloaded sockets waits for N RCU grace
> periods while RTNL is held.

Looks like this needs a respin, conflicts with a fix that came in via
net.
