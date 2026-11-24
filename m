Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795537100;
	b=DlzsDDMGnrcjVesfFB3Yg4i3N9bhXjmWxnJA3R9WQp6qUXMq5M0+Gvr73TF+rCxbU1Bx
	 0wiV7zUatO5CJFXgowh0QgpqP0s20+U//HYJnEHtdXq1tDIgHvgkEhsDl4lBmbU5O/LSq
	 nUHYqCAD8sLKGIxUbZ7jTg//yZeDEkcGGM12MP0Dfvs32bVGTY8gugeYsYPoELvDuqfVU
	 mRN6WOGOv1kSLkHX2kXTbCyPTOn/lxoT6F201E0jtJA1YJqwvUBPvS04xB4GmzmhAsnbA
	 YxgtAvD0FIZprNP0a/eVn5lcbZ35M0Gwmn4U8fJslKCoihCLTmsUmBrG1NDzJQcy9HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537100;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ps3dmenyy5Kz+Ld8FFyPnRbKN1BblcpmGxOsdgzLlkg=;
	b=cDMIHHr+oJNmS7hvLAiDYqMp0LlGXfebwur1kUsIf+lg74R7vRkprfz8Tsvgt7V7uHFm
	 V5zWzx17BqZ5U6z0f3bF54lf/Xxavf1Epf9Dwhf52QZX6u0ac1bzGiR23JQtKcQKrUWj3
	 IfF682VothdJY0mdnnJYqpVUyznzyelIANbzqvSCDmMpGpt7YIT2X5tdQ7EGR32Bjxqhb
	 niACc3Y50jQvTC4hwtsqT8kGcbfkLK52gmx0LID9/vur3P9Rjf4D/tNd3g2MQnkNPytq3
	 06sjuRY2d0HhYS6+sjveKGOEDEIhGFshZo3DQOHbXnEY3x9g1+bM1MSLYBhP0DUwSFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R4kWvQTr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131EF606A327;
	Tue, 24 Nov 2026 16:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R4kWvQTr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 553281F000CF;
	Tue, 24 Nov 2026 16:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795537099;
	bh=Ps3dmenyy5Kz+Ld8FFyPnRbKN1BblcpmGxOsdgzLlkg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=R4kWvQTrhv5/t4hnBgxvjID286GVtKgGVPPTfNlH0f89juWWjme1VO0ZkW7MgoKz/
	 R1j7NLEvLMmlDapHLwSKM6vg85noPXGaFQzMcgmjyS2QrQ677/ht6lOCpogtDCvO8s
	 K3aj6QQl7XoGOJaoluoegY5dUjWXVXpTRVnogl2VlgcLzl7Tbx8CYY+vSDi62SoZMo
	 9hFFolaLbQdwQoXsiLFnZeDuykPDPs/2MxhMYNlzfC8UhrxLj+aVh9yWhBon25dIyN
	 pxIJYj5DA3rVmjtb4yVjlGfUuE6/s3ELf18MS3+YuDpWFA+ok4mEt7bKCnJchVI2ZZ
	 Pzsck+Pcr+vog==
From: netdev-bot+sinfo@kernel.org
To: David Howells <dhowells@redhat.com>
Cc: netdev@vger.kernel.org, Marc Dionne <marc.dionne@auristor.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3 00/10] rxrpc: RACK-TLP fixes
Date: Tue, 24 Nov 2026 16:18:18 +0000
Message-ID: <179553709889.3294.10551657461606501758@kernel.org>
In-Reply-To: <20261124161302.4044422-1-dhowells@redhat.com>
References: <20261124161302.4044422-1-dhowells@redhat.com>
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

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by LLM and not proven at runtime). If it was triggered
   please include the symptoms, like the stack trace or kernel messages.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
