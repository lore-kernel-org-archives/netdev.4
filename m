Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795135209;
	b=pGbYKOZidYUM0Rl2UwLlDUaUV3BiqPNC7fAaxUlgP+B2XyBG2QLJAXCh4WeaRH0mt7Hq
	 bAqp4ciixC0kjMWrzNlNy/tiQv6XUD8NDfaiSr59dphqXCPr7p7xj9/8WvO0Dcohs7mHN
	 aJGAxb3c7pr0swBk7SJK2wwl6Zo14LncPMruBPl6XMKddZlSZETEGtFaSAG1b6jIE3iFC
	 hfJexdBUMtXDZXOdSTPXMHFBYXBe7SNhTeME1GKYIX/izB5uAAec14hL86wNa+avJVHaD
	 Hq2/d+YvnFJ2l4iWyCiOJ+nARo1vHOP7qj/QGutflXbnRlxSGFcWAulwvN3zfn2YUIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795135209;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=TnK7J16iivq4NpCynPGVy/NpFNzOE8A1Z99IAhn6oR8=;
	b=Cdx3TOcii+nGFOjndTxLvAWfgJG3fBKeWoC1l/j3SZ/p4RhA/cEASyMBiBxL9AXBEzc7
	 984f1YkBaXQfI8yPxTvc1e3qnb3+lo+g3kr79VyT+ZaxFCcdQmcSvwrWV9BgYKvMfZyHx
	 Xr29rNw8hJRPEY48u/S7H2skY+CSl1XQVKupFC+m/oDmdlJ5k1N3q5MHVIfJrzqM94C3p
	 em97M51cIVy5EcOKDRE2zVuGMr3ZxgRHhRbcn2J5Yjm0Gjewms+NX0SJ5inMAquhn71+U
	 Nl2E8dF85E0y36X7UZ4VAuGmJ8nKGIko2vDo6+pdSMrwfezaAnX+U5v3j7O/5IQnT8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PAhpHdZX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74E8606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PAhpHdZX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 462E71F000C4;
	Fri, 20 Nov 2026 00:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795135208;
	bh=TnK7J16iivq4NpCynPGVy/NpFNzOE8A1Z99IAhn6oR8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=PAhpHdZXjFodqjvCf9EH1NG0sQ1Jml/I+R2/yeIZYfmsCjU64NkXAOToXijGrUMGy
	 xQiTgGj9doZ5ccffogF+ZW2yA8v9lj7690hAi6X6j+myFtELDWsEMB8HoiiDPQdNKr
	 ryRLeqbnbq74n86D3XluP0zjnJ7KaV+oh9hfDFLhZ2BaiVi5vUnCfdjjHvpcadPRlM
	 nOwOfauneH7n6WuPPkHc6hhg92uMn7p3Hf9pisxYJHf5H8qMcMOsOUXrhcfzJgbRkt
	 u4yr0HwX3K0OSNfFtRah5X1fyHlxDp3/GvH89GKF0fNS+4Lj4U52I963x8TSdVGqeL
	 ream7D0Pt7Umw==
Date: Thu, 19 Nov 2026 16:40:07 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: memoriaru@foxmail.com
Cc: netdev@vger.kernel.org, daniel@makrotopia.org, andrew@lunn.ch,
 f.fainelli@gmail.com, olteanv@gmail.com, pabeni@redhat.com
Subject: Re: [PATCH net] net: dsa: mxl862xx: bound FDB dump walk with a read
 limit
Message-ID: <20261119164007.248c6d4c@kernel.org>
In-Reply-To: <tencent_50548A0CA0A2E93225C5F5DD2DA865400607@qq.com>
References: <tencent_50548A0CA0A2E93225C5F5DD2DA865400607@qq.com>
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

On Fri, 13 Nov 2026 20:45:08 +0800 memoriaru@foxmail.com wrote:
> If the firmware crashes or misbehaves mid-walk and never sets the last
> flag, the driver spins forever with RTNL held, blocking all netlink
> configuration and stack operations on the system.

Patch does not apply, not sure this is worth fixing tho.
I'm sure LLMs can point out 10,000 potentially unbounded loops
in the tree. And you don't even have HW to test this.
