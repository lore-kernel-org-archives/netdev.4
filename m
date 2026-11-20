Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795211059;
	b=riZOj5FXF2bN+hrn/gyZNV+T73tqzPiPXaDqFojvQeL7/GsE1oefiR3tk/4DRSXxOaKL
	 do0V+8ndD6wG4VDTS2esUxtHM4kYFkdV1QT3Ab6jRqxZoCfAU0wRg3uj9wqH76eAVLK4O
	 MOkOSLPA7KAjBMjxwNHfqRtIhg5xtM5BpDhE1tHKYocLmAK58Ftk0XC3bfBKef8WQjwmo
	 9hNp2VcFkTRqYIGozt9BV4oqDQqZnbqo4YdUqxqf8asDUShbsbNUDBlPUkGtWknVS5MBN
	 ZLXo+E/19Fw/cwWVofIfPxEtbq5idtkFams8DL9QfcGQbhAtetsuolpFIXJ/RibXFhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795211059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=nQPsyAfPITnc8nPJ0x4PphI6WYhqgT5+1sVMxYgDGX8=;
	b=lXUBjF32gb+2rMJiRA19vlNniAp3vgEhOMdHHWgEfODeERdkqdCCO+/N2PtDOdaOImyX
	 XHFjG6C63TPNNoEQJsOceoVIeH7lfxmty2hOqAEtf6W/PcaeBbFaCOWsv4/a8Qgxc3bLE
	 yBF0dQLZHW5oyjD+vWi47pX9g5tmoZFOTolQMs+TMGw2Nj2t0GEnR7E9yX4zyzntaWnb6
	 fpoznUd//jQJyYe5WTx/Z0p68qoIOHbG51vOmg0rpmU/KMyA4fu2j+IB9XDDqUe9PnqOu
	 AafLVDoMDY0NrJ0yCobJWZmFZn3P8bxb6epddfgKThKaHI1GcHkR7tuAeFKgKMcbN/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=stellman-greene.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ezVSYIi8;
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F88606A68E
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 21:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59F88606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ezVSYIi8
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-949589c1495so128173785a.3
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 13:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795211058; x=1795815858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nQPsyAfPITnc8nPJ0x4PphI6WYhqgT5+1sVMxYgDGX8=;
        b=ezVSYIi8tLByxNajlltBBgLnQ/sRRbAnlFJ4dAKOoRwG6Zl3azd+s/BBDJ89tgcLX+
         YZXuXZw1nceAJqutY9sZ+iqBiTEMn+TbZbs8J/wQI0vxMkON2aDhIh/WmJk5oU4XT1Wb
         aoNuJTbC+Ux0/yEsygbQ8ZPvcwK3/u6zLMLnsbE1ZASZdZxPV3OnoNHQUEb+FgpBjVwi
         E2dShug1ZHZUKOpn4rZcsGw/IJZKSrh5Lqe38L6dyTewujrwo6+/kv/orH4e4PVfj8vn
         YKx3//a1fw5IPEMldB35X3DSd7H+R+sP4Coj1nXgn4JrgrCjlS7WoXaqrEx19MqhQNhg
         0mQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795211058; x=1795815858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nQPsyAfPITnc8nPJ0x4PphI6WYhqgT5+1sVMxYgDGX8=;
        b=GKBWTAKpPRWXRuwPzpIbp99iYdgYxkk8n4N/X012pX3wBeeLsZeVUfDOs2V4w/9qeF
         s+xXHbL+R2kQ0B11i6hQanjQmtS9MmF8yERgUMOs599qCauJCSSDPvjYKf62aDIZ/oje
         lVUvQlVw3FriREaDtONj9Wu8ssTRtrQpzupheaBBXUYt63lDvFncktLhHs5Xgay3gv1R
         HsNYMBHEB7Zgqgl3Ona9aAEZhj8+MFQApgFfKCKCU+UDZCeYRjoTudwPUiokVqBBtipw
         ZHHgHha2LX6EGUkTd4eKG6BTC6lfzF50VYYWpfC7WAJveY47l/VYFSycQ0us9n1KCr+h
         oWUw==
X-Forwarded-Encrypted: i=1; AL+hErG6KtNL701V5dIp6PXi5U/ftMrXL0IQ2/JWsXQKXb0ryswTsVLsu5tjo8eQo3po/8/J+pWStcY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qjl0clR2Jjd48/2QFkXPfSLvOOXn/ZdhAzhAXQLZmzEBYo8zs
	GF336YQ2tA5o7WWuQ7HgubdHqVhKcAnB9Jo32V0fLVqOvWg/Oazhw7ho
X-Gm-Gg: AYBFou30y4/PfCig7XovKZwAI7hREht95nlx2AjxJ8UIsEpdoNRGFO42MIYVrm3qMgZ
	LaXnYaeJ7WmDcKtwUIKBH+Bppv2NZ1DYJ+6BtwyEyI8l7wKK7VIpmJlhvk+p7/Kv7y0mfoiXhjW
	Mf/3yg/A7mSbyK7SWC3O1sO0xshTJNWP7YUvBZoD+qmzOFjZhyN/1+QxZr3F2cO3/e0k3b+xUrK
	gMZvEjNmjHAj61+del6GFamt6LpD9h2uqz/iFtnzyg7qjBkzxD29Q9rmEarfqOOwygNpYMyl0zu
	LuoGbGykttZlDTDc8jWDuawAS5uAnYS0S1C7DF3qbfVO+/TacoslHftHNFRMKpC8yi7S1wGOxa9
	QErEmyYhoRo139kxZDqgDpm4WDqF8QHlz68ZEAi/y0tb2TWprhiuYwegf255IzId5tTsAZ2TfpD
	ENnjZ6Rjqoi8hfNXcaP1c9X2UmmndgPxsibijJuje1lK+2SaIY+DbqgApl33ElZYVDHn8B4RboG
	SQqTwzQVhdHgDLhn6k3cZO7ybki4CcMnxTpC1asKe6HfU9PRenc5Q2cmFIqzimnl2CdmkTfCFbi
	U8CQVvRW0HcnBt2qtiG7wC8wr+HdW4uX2brzf3Q+UvUV3XQWR1XKy5UMKsjTrsIjLs6Nt742ezs
	2WKzAL7qLeF8DO9PiS0vqjkJRPvTA8WShxFE99Wf4+603n25JaY3BTFKhoNjzLRWy5Uz5xnrybs
	HX4vwkqZqyXjlo9YnhBIGUACQ1bi0=
X-Received: by 2002:a05:620a:6c18:b0:949:49f0:3adb with SMTP id af79cd13be357-949ba81a58dmr698065585a.3.1795211058306;
        Fri, 20 Nov 2026 13:44:18 -0800 (PST)
Received: from Mac.mynetworksettings.com ([2600:4041:5c28:200:a4d9:d040:5fad:8738])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949c555faf9sm170267385a.0.2026.11.20.13.44.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 13:44:17 -0800 (PST)
Sender: Andrew Stellman <stellman@gmail.com>
From: Andrew Stellman <astellman@stellman-greene.com>
To: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-afs@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] rxrpc: Fix RxGK server to reject an expired ticket
Date: Fri, 20 Nov 2026 16:44:11 -0500
Message-ID: <20261120214411.44916-1-astellman@stellman-greene.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179520152436.3135.2656252511958141770@kernel.org>
References: <20261119184541.26343-1-astellman@stellman-greene.com> <179520152436.3135.2656252511958141770@kernel.org>
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

On Fri, 20 Nov 2026 19:05:24 +0000, netdev-bot+sashiko@kernel.org wrote:
> This check only works when the ticket's expirationtime turns into a
> positive number of seconds in key->expiry. Two cases get past it.

Both cases are real. I reproduced them under QEMU with v1 applied: a
ticket with an end time half a second before or after the start of 1970
gets a connection and a reply, and one with an end time a day before
1970 gets no abort, so the client times out.

v2 compares the ticket's end time with the current time before the key
is built, as rxkad does. One check covers both cases and a normal
expiry, and rxrpc_preparse_xdr_yfs_rxgk() is left alone. I'll send it
as a new thread.

pw-bot: cr
