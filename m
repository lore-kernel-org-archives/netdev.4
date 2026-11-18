Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795031727;
	b=0sjV6kiPdl1TV3MrlxAzVN5X2AnCBhzBygQL5+jl2gLHaYNE6h5RommjMQxCHqzZJWNg
	 UQjVMDcRKTMOfrJiO8jKds9eOGxgWVTgZ/i66B4XX4KSUd7echkBiYjIm/ORD2xmf6q68
	 AT5gL3Aa2b7lmxv8T0wEQdqJSR5r3PFvGDjrn0QG/LQAVDPRwwrhzxDVllqeh3/n43PIS
	 clotZgWqEP+mGczFDGZr6XoxPMwWFKForCt4OeP8d9VbxN5DOPBM3nOiGqEYK7Qiw4o6c
	 rgSZoJVjejk3GZM8DfKtnu/jFiBg0Pj1RCsRkprwU0F9XZ2JL7qJDwL90VIG0ZEdeuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795031727;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hIZvoIHER3UiWClDyLO4zBTEG/6o4NzBGFQLN/NZeIY=;
	b=hKCsVUEa2wnh059KaQC8KZ/PfL2sk+Zbp3FNUcxMpwPShiem4qfh2KsLMCAaJKFH9QOT
	 IicuBIFuW7w3hBS1tnt24jlME47y7OOSD7Eu53EWMFbtW99Xh3owhiMxyZFuSJz/My+gQ
	 fqrn/DioQPzl+IwePl1hWpWbRq34zLfWPd20gqrx/xM/vMqFe0ILt5PNSJqi6XvKZA6wh
	 h20syHI4zuVIlX71t9TwCx5zubHnzz5TUALyKoSHbxvNVKbV1XrgthtyE0HZM3icOLeFs
	 fGN2+1KGh1OeHzC3GluVQgHVHEjqL2u7DQ1UBc9JUYDW/Mm6OtUeYjofBCR5ERwvz/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YbtyxrUe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9089C606A320
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 19:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YbtyxrUe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10FB21F000C4;
	Wed, 18 Nov 2026 19:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795031727;
	bh=hIZvoIHER3UiWClDyLO4zBTEG/6o4NzBGFQLN/NZeIY=;
	h=From:To:Cc:Subject:Date;
	b=YbtyxrUeL3wEMTO8/HLbd7MsTTbI7W4f/FO+8UI0Vz/uJ2VHUAjdv0A40+KFyMAES
	 CtO8sm9ujP1Ndpn1vum7uwfQZDl/XSslY+0eKLPmL7PcMLRzLa7Tg3ozLlNMunLKj+
	 vHQVONsW4s2hl94ipphSgosi2ptAk8YPUfC+az23afKOfFHYcXpvbnZA+gGNu/Wv9C
	 xDwo7bZGGC9rvQswlgm57QtK/vrNnxk7rymaICL6Pe0rCLnZYgQjKf7/aXwEvrw93f
	 lGVGk0x4pvCLLYXcqMGs9LuHByjg+mzp7ZPkvbhj2FvNXJb/gS/vuaerVE/zj67MLu
	 51GIo0Dy0A9Bw==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Willem de Bruijn <willemb@google.com>,
	Eric Dumazet <edumazet@kernel.org>
Subject: [PATCH net] MAINTAINERS: add Willem de Bruijn to networking maintainers
Date: Wed, 18 Nov 2026 11:55:25 -0800
Message-ID: <20261118195525.3449546-1-kuba@kernel.org>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Willem is one of the pillars of the community and already
maintains a bunch of core protocols and pieces of the stack.
Make Willem a maintainer of all of networking.

Acked-by: Andrew Lunn <andrew@lunn.ch>
Acked-by: Willem de Bruijn <willemb@google.com>
Acked-by: Simon Horman <horms@kernel.org>
Acked-by: Paolo Abeni <pabeni@redhat.com>
Acked-by: Eric Dumazet <edumazet@kernel.org>
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 66e609de66fa..f089d3b6a4af 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19548,6 +19548,7 @@ M:	"David S. Miller" <davem@davemloft.net>
 M:	Eric Dumazet <edumazet@kernel.org>
 M:	Jakub Kicinski <kuba@kernel.org>
 M:	Paolo Abeni <pabeni@redhat.com>
+M:	Willem de Bruijn <willemb@google.com>
 R:	Simon Horman <horms@kernel.org>
 L:	netdev@vger.kernel.org
 S:	Maintained
-- 
2.56.1

