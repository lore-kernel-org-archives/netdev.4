Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795470070;
	b=GJPaUUpvgMyDl7IuVetUaZnUw4wl492cRt7QfCqBl5R8e8k9S6dPfuzSJ/53YwGJPFFJ
	 WbT0Y8Hn88d0voMe8pY3cnn0sAN+YNNRVtG56bZFDp/8Mz/5StrKi1JHJB2pID3nMIaZA
	 g7/hkQwxwzw+XrMufmhNyiyjSXhQ+1v4ZJWAO/aikgafDCEWDxM2SOopZN2IoIdcLwzuw
	 YV3yRkI6CaySWUOYIGRdkGOBTKhyz7iIKy6uud/VSEErpNfYtTlkkdGlrskjXJst64VNV
	 ksK/wkF77SyU/s1jx5HKqyQMtGT5UfNkgM3XbWeU/JWOUBn3mYUWsLzzFqf9F7KTeXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795470070;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=LimvVg+s1vOknWGyh+sfmyCPTBNengmVSYEeViDLewo=;
	b=xAmCV0L833jzP/qSf8qLnVO4RnVZs+6KzXHM4g8gTVjf0LEdZbqs6PAu0VIrwdG/l/lA
	 S/zY6EcSZtuMsrzhKDm493H//2hcf6+kjLbKuVsRVdSr+BnnPjQ5k+rTtt3Fll1z2J5Su
	 AeOdANSV02f+cXyvPmMbKESOiwj1KYVMoovegckV/Kwg3AfmgQzwT6FP2xJv4laUsCiXn
	 wB2p/u5n0y0bRfcSlYppi9lvUwXhKbTF8BDjYm6+2tJBjYs/t+w7sN0FYl4boTqkWGhMW
	 +8aEX0rgJCY+XivdoDf6yukXd5iLW62okhFMWXwo34GLxz4TSVlAGXzcIFtddMBvd2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SyybpLlj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A45606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 21:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SyybpLlj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 276D71F000C0;
	Mon, 23 Nov 2026 21:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795470070;
	bh=LimvVg+s1vOknWGyh+sfmyCPTBNengmVSYEeViDLewo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=SyybpLlj0dMeIP8GJoBu6uprmCnuaNjnzt1j1hEy5Kk5vhc3WmQcwrbEKxJS09Vbz
	 BkVsr/10Z4Uovb+4kcjs1EEuU10TRjtuyujCy34s0RjZEQ2dlFCrpwzuXLJCk4va9u
	 +H30Fi+eVYuuqUtTAhq4gbi1lMY275L0B3OlLPO00D2je/HGU3dI4Bm5W6aNyYJyHD
	 pAX8HXlaSDd0ecA86hYY1+sTDJofZ2dpEiNi23+qje4gDePrEnJNumppjJkFp4/yit
	 YaX73d6p4HGQZmvEmz/T45OjhPVXyS7Z5xq1i7lVgb3+oAfw3CmZomaFB7/AQ3cEGB
	 iaZnGF8J7g7Iw==
Date: Mon, 23 Nov 2026 13:41:09 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc: <davem@davemloft.net>, <netdev@vger.kernel.org>, <edumazet@google.com>,
 <pabeni@redhat.com>, <andrew+netdev@lunn.ch>, <horms@kernel.org>,
 <ahmed.zaki@intel.com>, <jacob.e.keller@intel.com>,
 <intel-wired-lan@lists.osuosl.org>, <anthony.l.nguyen@intel.com>,
 <przemyslaw.kitszel@intel.com>
Subject: Re: [PATCH net 1/2] ice: don't unintentionally switch to symmetric
 RSS hash
Message-ID: <20261123134109.30ba46d5@kernel.org>
In-Reply-To: <awSrrR6RfQYjhPU1@boxer>
References: <20261123205600.1794292-1-kuba@kernel.org>
	<20261123205600.1794292-2-kuba@kernel.org>
	<awSrrR6RfQYjhPU1@boxer>
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

On Mon, 23 Nov 2026 22:10:05 +0100 Maciej Fijalkowski wrote:
> Let's just get this damn thing fixed ;)

Thanks for the quick ack! 

BTW I started going down a rabbit hole of fixing more bugs in RSS
handling in these two drivers (eg ice assumes that rxfh->indir == NULL
means reset to default!?) but I gave up after 30min. There's certainly
a lot more left to do... let's see what Clashiko points out.
