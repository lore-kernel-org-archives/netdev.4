Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795417345;
	b=vFfC0oJH8W8NsA9MFi9OrwY2F3jLI/lppFxmmCdFacJTzD0+bjn4pISZBQXBQp1fydTW
	 VN7hmBcFIl02MOpwzT7ymiD/IKJuLX2D2Nle3En5URl8nO2viaArPPtHIIt21Cki+YFL3
	 CaswuyZjJlX39ewcJE95oSJKW8Pgp97rg/TiJFEqevV6440hKLe5hcT1SU30+uU2tMiJW
	 K8aJH1+GE8mOEgUwW7p/eFnSrG9R2pjPkkhMKsJMswob9JQHbCI8ktLP2rLSawQ3DNXVB
	 xD5YmWlR5WFxphwmky/4+dD8vcBp02Oz95CFZtY/KJjIgrQ6hBW1KJ6bP1mTfD8LnZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417345;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	b=v69anBEUFwV7uzdskgwqH17t1Pi6Q8QstAXY+ngq78F2jsHCWdXn4yShFJ/CdfiwngRo
	 Vug1f26l4wRCg9CprRAk5Glqw4X4LlupDdHOdMuoB6jmdGNLlEQphp2e/hyVulr1Aejtf
	 IN7jezJEtLBFv9rT/3x1srBbZR3Vf2Ksg1oua7Y0F2Kz2Qs96q01L3diuljtAIO8oBM07
	 wEsGZjP4+EX07GjOiYlzCiv1+2CKLSrCgTJv6RlHEWPRnNScAngXA2fwA9rYHY800IavP
	 Mv63zfLPw1NNn11dvI85ccBOSURxnSiJvbL/pNeal2I06GLwe+WzottOu7sTSJSvL/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IRzEWJY2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478DB606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 07:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IRzEWJY2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 335871F000CF;
	Mon, 23 Nov 2026 07:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795417344;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IRzEWJY2OFpU5Xprl1SH+4BluANL4jrafPA/kzMRVPNkMxvPa/aTOWls9ofsgj0Ff
	 tsccQGbP+H4BvRYYyPaBVDCFWZ0c3S2020X0D+e6PDeUTxlO98101hPcd8BvsVFNWT
	 MMPkThhsPNd2IlrZuKuGhpe4PI9XCRwaaXfamGH/xFqvy/v1lAg/iV8JzAz3gIMzHr
	 GeXN+lipBRm1tfjJARB0/bMblWHnapTmHQChydSotiT5r94jTTQJwLf6bKqNy41OeJ
	 Z/jX5kwSZacd32/LCqo3Oc0kICK5eghfPymPYfwagjnywrCLaWJaINgS+099X+j1f7
	 OeuGrhS5knOvQ==
From: netdev-bot+sinfo@kernel.org
To: Qiliang Yuan <qiliang.yuan@linux.dev>
Cc: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>,
 Nikolay Aleksandrov <razor@blackwall.org>, netdev@vger.kernel.org
Subject: Re: [PATCH net] ipv6: reject released nexthop object routes in
 ip6_dst_check()
Date: Mon, 23 Nov 2026 07:02:23 +0000
Message-ID: <179541734374.3294.12814339545104396123@kernel.org>
In-Reply-To:
 <20261123-bug-net-ipv6-dst-check-released-v1-1-769d320a2470@linux.dev>
References:
 <20261123-bug-net-ipv6-dst-check-released-v1-1-769d320a2470@linux.dev>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
