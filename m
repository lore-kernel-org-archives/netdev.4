Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445940;
	b=T3+0I/Xora8tXgcHXkbDiflCs3np7kRz5NmoNPJfooSeigCr8RyVyjaaXMIUkROuLIKK
	 iCZqTXusJQpYz/CSQqwbciSTixOxn9Dmgk+WQLQldt+bjzahClf3SIS7nckpIBIbfzLjF
	 k2vfbH7wKeNXaDnImNir6SJ933KFweTj7FQTvmpAHQX5/W48dmryaXB0s2SJoMM4lEhFz
	 xhwSc9diUPaKd3Cb1j6/4F9+7SxfvjZV9iRAnDCYjoNPl/FyVHiKDyirZLydZSBbbk+7P
	 4mmRrPhXzw8+eMLDXfhyv15ETSQRtsPgqpTBGI2Oq8hyrno5AMoz+kQBHw9lFo0KnBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445940;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	b=NmX3sZrczB08PPx9XUjgovzPu6Yq5XMrXs8EjL83JyKWRmmr0ITr+muhISydY8YWZdkE
	 zo8iuhbFneJ9O1m26FwxHiX5Nw5H9VPkBfnXpusqHa+Q8Br+6I8yusNU0Q6bFEoqWpGpj
	 YMh+IIII/akMarpNdqoelkoO+4yZKYymxqO+wCZk4tuJl2oIf1eNmlYAO0m44LqmKoBqP
	 1V1zlrgNUq249yBhuSlV7k3TGzXI1otc0eJvq+cb3e+PjvWHd5PypIXXxB7YMqR8MDF5R
	 FeP3ePHcU7KRIyxXSvQJp59gHTW/uOXtP43HapBDULqkVCAbDXNmAb5AFh4RgYksFag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="h8VgjgB/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B43E606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 14:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h8VgjgB/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A83B1F000E6;
	Mon, 23 Nov 2026 14:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795445940;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=h8VgjgB/NmbhzgOWsXE/GxtW0uGE60KVjCoYBMTbc88AsY8hwfWvrGKiUKKf27Ek0
	 S2Z3zycIrUvDVqSy4Wve6qntHoFUKl1ateox/4KQnSrA/BcQzWqSzNIqd0C6IF6lln
	 CkC5Q+io8lKKKC+oEtVgCTyCu4cLoqyv8aPg22ttUO6Yq/dLe4dlULsUTijy/BMibn
	 FFq2jHZ6rH20YWUWfjwPRXN+YdJHvIhZDsW3+uWjeoeVvHw1EbaUAbiAFekPTqXzUH
	 hGwxAvsQGr28LYY4Y3c1uTfnPL0Yv+LMlbv8mTJ8IAamPSg9Pw4cAKF0glw0WAOAdl
	 PemcEq5WW30Zg==
From: netdev-bot+sinfo@kernel.org
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Horatiu Vultur <horatiu.vultur@microchip.com>,
 UNGLinuxDriver@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next] net: microchip: vcap: initialize the top address
 of every VCAP
Date: Mon, 23 Nov 2026 14:58:58 +0000
Message-ID: <179544593891.3294.14856771777951641475@kernel.org>
In-Reply-To:
 <20261123-microchip-vcap-top-address-v1-1-fd1953fad422@microchip.com>
References:
 <20261123-microchip-vcap-top-address-v1-1-fd1953fad422@microchip.com>
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
