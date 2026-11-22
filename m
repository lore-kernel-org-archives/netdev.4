Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795386442;
	b=x4JT0/Jh2jf36rKwk2SYMyfoXoj2IlIY+b75N5kk7yOckLyQjeNV3LqJLJs4hZPnHf13
	 yoRRfMZswgeYmRJo+q//yji1pe3pBL+LHJo9/xNPj10fQ9zBeJM5wYrQ50McrHHiKGb8O
	 YSMdeQ0CCIx3ul6DbCg+tR95ZsXa6x/D9mfzxQiFdShI8N+/xRq1SgX1l1XuzYqcasXik
	 sIwGO26idL6OP09MUk4wra37ua6i6EefwH6dzkv4gWmPAPfOKYs8f5onlQ+aGiLMYYeWs
	 HSjJAmWCm7sJWXKC4UZZPqiLXbij7y8klCrzmW1UDBnns3sP9qC15XgsYHCfE4g9I9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795386442;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:GIT:GIT:GIT:GIT:Content-Transfer-Encoding;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=sFwfjBpvZaqm5OdxxVr0sb5uUuqwyyrYjWgbY6hmtD/TVRBxWMvJngX/cjDNaA/LPoTG
	 dGa48FRxZgxpnMQUT5qxld7DAcQnzJMnjpqpSz4cnbGhUepRP068Y+vkwO/vQ+ye41Oqp
	 QWCBQ75McstSt337wKiyTgIzlb1jq+X/GnMWfHI7h40NkUvEpD/m3f4VX9Ug2b934b4OM
	 CU4JMKinNOtdiO3Wez/s0x5AbAE8X1pLAUWmuLBolVYef/xibWTvXOQBM2Lhp7OGZ/lpR
	 n9WrHD74DRF7HLoP6kEROxXZtkR+ZwMABYHOFN21S/tqq4kXbz9o71mlnWUDZTVQgOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="NYZEK7X/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B11A606A31A
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 22:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NYZEK7X/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91E3C1F000CA;
	Sun, 22 Nov 2026 22:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795386441;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=From:To:Cc:Subject:Date;
	b=NYZEK7X/tbkyqV2JnQS6yNVB9D/s+grzyt8fB/YdlojHbhDqEItDF+rmmN/vNuIRe
	 qlsJYOPzFkVk8K68bk7CxJ/pQWflworbLE9Ao0g9lBdWGftq9UGJ+2u0dLsR8ETPdu
	 QCEQ4qNL93xP8G+iChSxE3X3Lgfna95cAWfUynpITyYQiH73AMMFb/JEu5SV6TyzZF
	 mD1nCwGr6IIma4e2hG4fml13StEgaODomyLnEI5uhySHmyZ9aIJsyY5OfLYLCFtVlS
	 bLlt5g/Qo8W98RkdB1cO15wdYDN74WbGIYJHhbaWHemPEJwD6IB1ybzUsEeNPvGS6j
	 njikn7VGZQRoQ==
From: David Ahern <dsahern@kernel.org>
To: netdev@vger.kernel.org
Cc: ralf@mandelbit.com,
	David Ahern <dsahern@kernel.org>
Subject: 
Date: Sun, 22 Nov 2026 15:26:57 -0700
Message-ID: <20261122222717.126333-1-dsahern@kernel.org>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
GIT: Lines beginning in "GIT:" will be removed.
GIT: Consider including an overall diffstat or table of contents
GIT: for the patch you are writing.
GIT: Clear the body content if you don't wish to send a summary.
Content-Transfer-Encoding: 8bit

