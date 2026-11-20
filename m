Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164438;
	b=zeaAJ94PKbJXwlpYvPZ32K/ddfWxd/P+IucaJW0+mOJan1jTc3d5zu1zooqwBV9ojPb+
	 yojsW6PD1cIkvdL3Nn8D9Pjhzi/2OMMtUSWOd2GQcyrawOvcw2mXvZWQ+RqwPWp/OYI0o
	 +aUjDbHMDFBpcuFctfZxPhDV8ZuX556lNzzsNizj6tjTS6M0naKKDloaeaGnP9VwpJSoC
	 TWpacPKgoxesUeFGiEQ1Kl5yuFhTd7z+Y/QsF9B/QCSuElVh60g+IyYj3icRyhhQajAOL
	 doZhsC0qgPop+YYlrl9K9oS7wEHCOIcWtg9NhHQRXYj2nlewOREBcuNXewdZYFxOaVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164438;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	b=oJOzdO6HB9aeB4S/UoatLKwaPhEugJyzCaG4E0AFLjViO5Zxamy2hbOQPhjbuw2Ecuyg
	 w9W9DnDbGI3T0i0V7xY70Lt7e8B97YikEjenEHXJGXcJFD/dAw/yx1oa7apU/Sr6Rlmoz
	 elx2C9rC2lIHvbo1y7Vuy4oJU9srILVYV198mgMEVuDtnzgDYpzzv64lesTjjA/UqnaHm
	 HMqJ21AiXuDDp5Vbp9I3elM5ynCH37o/qzLMMWYbR0Cas19VxuvquElE0V1lIfiSyzCAe
	 rF56Ys/Bc8N7kKxZ8a8lKTl6S3jclR12pAWjfT2DsNhl5BNeUMCXTalw/Z8fT/nK0LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="S5/VZr+U";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BA2606A320;
	Fri, 20 Nov 2026 08:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S5/VZr+U
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7206D1F000C6;
	Fri, 20 Nov 2026 08:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795164438;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=S5/VZr+Umuysu+bcLk7Ph48kXOlST5CmEZA1GdkULEbgI1UqueUfqdkRzKPBah81S
	 LXPfBKSgMIMbzw93rGM3EJsSNca8V6qMI8cNpJAE7kaHHRTXsYvU14sEcCsIxw2QvT
	 Nf5gfvd8FnAaMp9xb5GlllObYz//yeHOWoOihhUNX48jo7Q6aUd0hliQl5H9PKPNZr
	 Tg+wSgQ7So4jWIZzaHTQ9jk0Bnj5dx9ot6c7ewiydwq8PQT2wwFP6ahN6D63cDXQTm
	 EzLDU2iLxf4NWqE1hsis9vt09pUd9Fyo0mbWaCZ34bkWfsLhcT797eYeHlvywyXmtW
	 CAqz6GwTMcPMg==
From: netdev-bot+sinfo@kernel.org
To: Alex Austin <alex.austin@amd.com>
Cc: Andy Moreton <andy.moreton@amd.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
 linux-net-drivers@amd.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] sfc: create PPS workqueue before registering phc
Date: Fri, 20 Nov 2026 08:47:17 +0000
Message-ID: <179516443701.3291.7213639772239952917@kernel.org>
In-Reply-To: <20261120-sfc_pps_wq_fix-v1-1-5837aeb14a4f@amd.com>
References: <20261120-sfc_pps_wq_fix-v1-1-5837aeb14a4f@amd.com>
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

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by LLM and not proven at runtime). If it was triggered
   please include the symptoms, like the stack trace or kernel messages.

 - What hardware the change was tested on. For driver fixes please
   mention the device (and if relevant firmware version) used for
   testing, or say that the change was not tested on real hardware.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
