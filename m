Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795537391;
	b=Zf/ZT0oGjZQB0rE20i5wXAgbgj5XIowj9wZmMKGXHar7LiJkiE+3ukUH1BCZhvWytQws
	 gDP9+Mv+E7WNf08bWRwEKD62/JCiCkeVNv6bV6en32NJhH0k3N5sBtET9Uv0ixI6n7rGc
	 iFVpHpfWZTj8/VpcFoT935SkYzaaebIAxiEH8FYc/s6weT6K5lpnfgZ55BUZ+Be0VNV7C
	 eGr7929nPSVo0bZ8sADbT2UzQxbGa8a304hofrMo/EgTe6KCGYH336ns6tYXQou0RlQjd
	 WpgVnoQMHnjJsPW+DIdT9SoCA+Uhz0AV9b8naXhX6jEUfo1wx/yUQgclz8n2japom5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537391;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=6Ifq/Fw5ZuRtrSTyCeZ7suWzrD08HqC+VdbHF/dZAdU=;
	b=VuyaxEybabByqCu5FOzxras7UPIiLv39U2mJePgxff6AsUsU3YppMxssT0i1DSm6VQlG
	 4SOfmnZZEepm3U2UgNEHff0y2z35v4RfBA9XZklVtABDlQI3WLyKdXra9XOUQEzay9pxd
	 tQCkm+oSp+Le+hmVl+lW0+5+SPaiKIPgbrAdfcaP9AvFS/v3a4zGjZ3AykpaAx9oHeXSB
	 nYdSqxw028mIGCuB+T7RVD1s59686FPkIiqGGmHy/Cz6/VQ2vucYk/sQLWgLcz14wa3el
	 bhEfVVb3s5n5fnpVPGZffmnNLYWB79t6ZvONbolPROxuXRZF3fv2rgjEH7g4aCu64zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=HcksWSwp;
	arc=none smtp.remote-ip=195.10.208.42
Received: from mout-b-112.mailbox.org (mout-b-112.mailbox.org [195.10.208.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5597606A31E;
	Tue, 24 Nov 2026 16:23:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5597606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=HcksWSwp
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-112.mailbox.org (Postfix) with ESMTPS id 4jYp5571WGz5xNV;
	Tue, 24 Nov 2026 17:23:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795537386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Ifq/Fw5ZuRtrSTyCeZ7suWzrD08HqC+VdbHF/dZAdU=;
	b=HcksWSwpxr57LUHx/yLZJ/seJvSzRB+ur7QJhlV4iNRVF9dT/Efws6Wme41DSmy731E3qP
	5fEXaXVeHjcEGeqtApaoAEqnuNLho55klAueFikn1VpV1uW/5yOwRXtRoJSntQR65xCdmN
	+OsVQQ1sn1cu0SPraO4QX4pqOa+7T+1PubOqmJbNyOjeGvMKzbJaGvg+8mMnDhvtLm8on+
	88gLA12Q9LzSh4ll2eD7QOrYFd28E54j1TtnTP9dOOODQZ3WSUylWADzgPo1pfU3hpve2X
	gDiz+RtKR8NSLZ/fRb143fCGBqLra6EHCbTkX1iFhNSb7CC6MiBNTkMSchx+8Q==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of ralf@mandelbit.com designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=ralf@mandelbit.com
From: Ralf Lici <ralf@mandelbit.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	ncardwell@google.com,
	kuniyu@google.com,
	steffen.klassert@secunet.com,
	herbert@gondor.apana.org.au,
	fw@strlen.de,
	yanxia@cmss.chinamobile.com,
	sd@queasysnail.net,
	antonio@mandelbit.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v4 4/5] ipv6: add ip6_dst_lookup_flow_cookie
Date: Tue, 24 Nov 2026 17:22:54 +0100
Message-ID: <20261124162255.765141-1-ralf@mandelbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <179551601473.3135.7741252633833955764@kernel.org>
References: <65536a8e6733b8fb94614de2e104548a921a52dd.1795166508.git.ralf@mandelbit.com> <179551601473.3135.7741252633833955764@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4jYp5571WGz5xNV

On Tue, 24 Nov 2026 10:26:54 +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 · High: 2 · Medium: 0 · Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
>
> - [High] ip6_dst_lookup_flow_cookie() (net/ipv6/ip6_output.c) only closes
>   the lookup/cookie race when the returned dst is a plain route.
> - [High] The generation check in ip6_dst_lookup_flow_cookie() is only
>   sound if every writer publishes its full routing/policy change before…
>

Both points are addressed in the next revision, which drops
ip6_dst_lookup_flow_cookie and moves the validation into the dst:

- The route and path dsts of xfrm bundles are now validated against
  their own lookup stamp, so the late route_cookie and path_cookie no
  longer matter.
- The xfrm_policy_insert ordering will be fixed separately in the ipsec
  tree.

pw-bot: cr

-- 
Ralf Lici
Mandelbit Srl
