Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795127934;
	b=G0/E5LGiElY9TsL9lBouf+3iXHx3o21iB1FLYHD+SxvedOweyBVWv/+sRkHeNyj47TRv
	 8Qx1rXZXZBzQJ8vdGAvw2C9Q1OfkIsWsTJWEi7at5jtBkqBf78RdyZyu9SU9Cb+q4DAxT
	 AOlM4YkZilmLwdscCPceyZ/iw4/aXnk8ouPw7ZiaeLX+u2+bMFiodjof3K16IqfAvp2UP
	 Ed7oDKGerdq+v6JaCST2qr03unnZpbxz782EFlPBLX9p25497BWQKTQaO5KLlAADF8RpN
	 SL7dds/bA7f6/6ujQocnXGEIyRBqwy94/Okg2d0gCED/pwcEHB7ytXV6LFCyQs2KmJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795127934;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Ux0aj7SVyJAjzz5XrFbj/lYnnV59599YofNJSY+UiKQ=;
	b=XwJ51U9z20YsMpZ+ew6q9HqqEcT1WM0OgQ0KZqZRzZEO+b1v+Nne5wgRhqez+bfZKTPL
	 cRrPkjDTVcLdB/M7SF5VNAchCJZwkOAP5hDonqLUBjtIfxntO6Y8NGqgJUAa8UAJzq4Ig
	 995RRn/KxgyDv2B68Meg84e+RrZzEsAemvtYI+ZyQySCWxutfGvQr8/trjERnv3ReW08q
	 thj6hYOirvxJ1DF1yKcpBOT3KDbylMwqMNgW/oxwpH+uz0dzpoKE7k3Fw8bS2Qljk779R
	 rPUqr1juzWj8BSTMpSbHcILLAuh2Ks4UG40ja0BEUMCOqPzZO0RXh7BsNi+kbwoESqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bftiKxab;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC1A606A320;
	Thu, 19 Nov 2026 22:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bftiKxab
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82E2B1F000C4;
	Thu, 19 Nov 2026 22:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795127933;
	bh=Ux0aj7SVyJAjzz5XrFbj/lYnnV59599YofNJSY+UiKQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=bftiKxabHkhadyQR6GUh9j07KuVhRWEe3TONDegEMHms7wQBMRnHQvWRpJQWVe50M
	 FeAk97I7DAkkXPVCwrNt2AXZJ3JzdScTcFuAXAOoYBQuUa3DXPdUSG6uyP5wUIKpfM
	 CA3L5XtqJNQDc+En4nL1ivLZYKVxJkdmwMl3MMOGU2J5XH0STcm/qaj1DVMK6chtQp
	 iyea3PUIMQxP6P/WCLoBuqH6sppinW7MgyZrdbteKxnaNYOYsYfbGf9RYV1Fx7Comm
	 ZsErRNkOjQ1ddqs6Z8J7NgWxPhWfxbnkw8UNpImL4XFpCYaLj64VhRbFJPDR3Zs/gy
	 w+XixueHmWBcQ==
Date: Thu, 19 Nov 2026 14:38:52 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Joe Damato <joe@dama.to>, <tariqt@nvidia.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org,
 linux-kernel@vger.kernel.org, daniel.machon@microchip.com
Subject: Re: [PATCH net-next v2 0/5] net/mlx4: TX helpers and deferred
 doorbell fix
Message-ID: <20261119143852.3bca9000@kernel.org>
In-Reply-To: <avyELebAXqr4y1Yi@devvm20253.cco0.facebook.com>
References: <20261117155353.2250540-1-joe@dama.to>
	<179493106742.3291.11434436383058043225@kernel.org>
	<avyELebAXqr4y1Yi@devvm20253.cco0.facebook.com>
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

On Tue, 17 Nov 2026 08:43:25 -0800 Joe Damato wrote:
> The only fix in this series is the deferred doorbell flush (patch 5), but I
> need the other code (patches 1-4) for SW USO support I plan to submit next
> if this series is applied.

Not sure if this is what you meant but this may read as if you were
sending a fix for net-next for convenience of sending more patches.
To be clear - that's not a valid excuse. That said, here, we're talking
about a 10 year old error path bug which nobody apparently have been
bothered by. We don't have space in net for such things at this point
of the cycle, anyway :S

Tariq, could you ack?
