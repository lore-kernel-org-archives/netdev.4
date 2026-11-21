Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795224775;
	b=o99K/MdNrHzVPvaSa5jKzn1DVZ3iB8T8oP3tIxWOOczCBiPIwHlMKW0KpWMRS4HhU1BL
	 clBLRkL0s/Zp4AH4CfIwRdLzM3XCN22IjdTsCgCoYjoSsBBrt6Gvi8aoZl1dSN4ViwOK2
	 eOlwvJogp4m/Zyj5s0HYnnfCocsMlD8BSz3YFILUApzwCSuPalJkueH2tpjEPBt35du/v
	 5DmAgweLsN0Tl5WsPX42YfKNJMwXakcNy4tq3HzNDyRDHEh07p23KevqScDWeR8lelgcD
	 rm7kDQeBsn5e5xDTDxtnaUlE5iX7TvVD2syeW1ivvgnSujCL+6KUgP8mCFyvRelGimA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795224775;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=+rUixZNiOYu2ce0qv/3tSXFaU25n6O1T94++iRJ/984=;
	b=0XmF7t3GKouhseMKt3drTV3hiZNLVOSHRHs4BA5QcExj5aRHUwBxU4NolwbsJ5/+a+rU
	 mvJi11sQO4blcmGgyrRuivJVwD4N/7fLQJNq1MPhRLlJbReKfeT70HvBVwE5qx8coo3Tp
	 MMwLtGI6CrZDlEOrLfoRb/W6jUbpIqmEBBOENtnuNh2o8Auzoo9UnWvwZCy2hhs370KJS
	 w0bxLDvwQ08KNSmqLHWNpFIU4GLZPZMCFtVHyKQdknHUPT+n7kIgi8Te1Twv35BUAiGu/
	 vnPq4RRoDCU9gXoCKfJPCJ9XeWyyHqa9iaW6QgHedzJn8I446+JlOTbeU9XbQWl8hXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D0N6jHzV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2B5606A33C
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 01:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D0N6jHzV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D4651F000C4;
	Sat, 21 Nov 2026 01:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795224774;
	bh=+rUixZNiOYu2ce0qv/3tSXFaU25n6O1T94++iRJ/984=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=D0N6jHzVE0GF1R2+tYFxmjZEEiByCJLkSgRwB/9pMdG413TfMtgEC93NWhP5Y7DYG
	 eg+GfzCF4iIWU1oIcAvIydNRnY09kiB/1ARnHexea2ozzhcZOpD3HKM7WpPs7kTFcW
	 38JmMvqZhgWBgKycRCKmaryYTIBYJlwv7fIPk0ojLcFWxusFFtXx8Da6z6xfFac9rL
	 xYEdbM4aG+hIGwyB+/BIw4BaZP5vtsf3RcpuM2q/Aj9bp05XGRtR865GfD4ufUGjGU
	 KPxv0j4QrHI+jle3GChtbjtzb6/lgxdRrlFSfyW/+iYI7vYi2nXF0+46uwW9Y6PzkF
	 shVFX42elAVgg==
Date: Fri, 20 Nov 2026 17:32:53 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: Donald Hunter <donald.hunter@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, =?UTF-8?B?QXNiasO4cm4=?= Sloth =?UTF-8?B?VMO4bm5l?=
 =?UTF-8?B?c2Vu?= <ast@fiberby.net>, Chuck Lever <cel@kernel.org>,
 netdev@vger.kernel.org
Subject: Re: [PATCH net-next] tools: ynl-gen: avoid shadow local variable
 declarations
Message-ID: <20261120173253.5dd0c949@kernel.org>
In-Reply-To: <20261119-ynl-scope-v1-1-d3b0c964d4cb@kernel.org>
References: <20261119-ynl-scope-v1-1-d3b0c964d4cb@kernel.org>
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

On Thu, 19 Nov 2026 16:30:34 +0000 Simon Horman wrote:
>      for arg in sorted(all_multi):
> -        local_vars.append(f"unsigned int n_{struct[arg].c_name} = 0;")
> +        aspec = struct[arg]
> +        var_set |= set([f'unsigned int n_{struct[arg].c_name} = 0;'])
> +        if aspec.type == 'binary' and 'struct' in aspec:
> +            var_set |= set(['size_t size;'])
> +        elif aspec.type == 'string':
> +            var_set |= set(['unsigned int len;'])

tools/net/ynl/pyynl/ynl_gen_c.py:2222: [C405] Unnecessary list literal (rewrite as a set literal)
tools/net/ynl/pyynl/ynl_gen_c.py:2224: [C405] Unnecessary list literal (rewrite as a set literal)
tools/net/ynl/pyynl/ynl_gen_c.py:2226: [C405] Unnecessary list literal (rewrite as a set literal)

Please drop the Fixes tag when reposting, and you can add

Acked-by: Jakub Kicinski <kuba@kernel.org>
-- 
pw-bot: cr
