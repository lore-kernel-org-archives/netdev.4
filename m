Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792465;
	b=DPLzaN5YObWmXsskH8JnzXK9tzsmvGwsyuRFu+072DVuIkQfRY3YPpKSXfJKrcFV61RT
	 uLL7RXxRNbcNgjCBxV9bjUYbcDpSAvVRTE+tQwMSzDEjWGDCdvoGD+bChD1cpfJY/DXdt
	 xxQoAXWIU46TtNIHmyL/fd9XdjNSl1a5s3fPv9NWax0GoxsSgxDY4V4/5rkrUE1KLAinN
	 rkgjmXBf2BrodGywydvkAPmu4rE8hnW3RWV8hJCW8vNdggrhhLHNYLOqrM8T2gs/BPSP3
	 U7JnvCHEKXES5hoM46jGy5vtF19cmUjAPsVIqgDRr898Ew/Ppqj1uQBqnVbxjSrOQvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792465;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	b=u4qxeoZobJ3KZVpt/d/niElDVvyFnxR6QieTGkXApdGd8GmMAVip7Mz4wBoYMA3Euh6K
	 dlblypQGD+Cdi91zQ+77UMwYJ5J2xdahmKrGl7T+StsyIoA/PenNZF7H87Glvg1SkK6KT
	 /3bRIq+6wiUuRRDtJzlpkbGZgWmvm1FYq3Am144LeCC6eaWWr+a3obEpLo6VS2O+L/OQY
	 IzqPOb1WX8ASxXilV73ofNMT/IOD8UEPkQr1vGX7lLY0dQ3Qgy3iqkcFq3L+qSuCVyrrA
	 5sVhjzedEK8Gfg0gvaYfpxrJQTPm71BD4wtg6gwjQI1ta2kmmyp9DJaGVC5XGG4JcnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="QqZRUz/A";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362E7606A332
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 15:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QqZRUz/A
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCFA91F0089F;
	Fri, 27 Nov 2026 15:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795792464;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QqZRUz/ArlxbWlM03LgJfs9VF+UAwc5DMngKx+9ofj9lWhkTztQgAWWt8k1FV3LT8
	 5HIU26NfG39zcUco/G8nQU+zsYYBV8a49WIxnCQ7AH4fzFjbHgEupInI2wGTk0COf5
	 SxzzsRmcSpmDAciR2eANiSsNHXI2IQI6x29DjgPtZeLnpGpEu/zm2MJuHBjElve5n1
	 0gtiZ84/xiSsPr32Qde0l58jbYFx4KtrQ4ANVSDCbBVV5BwsGtmYmdRE8xZqcoZ9lb
	 035qpKb7gkqEfIxRCs270tIUFfkttjH33xlUeus24goOcEd9T7j/tPDX0/FQ4inMNp
	 Sg2fgAMphtAqw==
From: netdev-bot+sinfo@kernel.org
To: Antonio Quartulli <antonio@mandelbit.com>
Cc: netdev@vger.kernel.org,
 Subash Abhinov Kasiviswanathan <subash.a.kasiviswanathan@oss.qualcomm.com>,
 Sean Tranchetti <sean.tranchetti@oss.qualcomm.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Daniele Palmas <dnlplm@gmail.com>,
 Koen Vandeputte <koen.vandeputte@citymesh.com>,
 =?utf-8?q?J=C3=A9r=C3=A9my?= Jean <Jeremy.Jean@oss.cyber.gouv.fr>
Subject: 
 Re: [PATCH net-next v2 0/3] net: qualcomm: rmnet: fix TX aggregation bugs
Date: Fri, 27 Nov 2026 15:14:23 +0000
Message-ID: <179579246331.3294.12257658118316701172@kernel.org>
In-Reply-To: <20261127150827.785753-1-antonio@mandelbit.com>
References: <20261127150827.785753-1-antonio@mandelbit.com>
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
