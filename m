Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795338750;
	b=ax6Y6qUg7pvpr5+lGfVVHvR9rqyncV6CsPe/Ys77R/jYXpwk6NEHavcibG0u4TMXjpU7
	 9yrD0CYTvF7YarI+VYDb+nNhvuIWpmONPgZBXnv0mUbnR0kpOeDo17tKdzXa+vOBcki2c
	 A5f22carfttXvt8SUCKPveafrQa+efh1A45m7LMPSS+qc4rCI3rz94dRn9lR+1EogDSY7
	 QDD5v9cVhEHOBUWzJxt5RXkoO5EHKbk33X5aSYwX8Ly5a7nFkxHAcecE1pn1vXL//ksBh
	 0kIx0qq+m63P6nao30kMVk7pS098Kisd+haOeVgLF6Lg6jG65jaBaanvi7D3MMK4xbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795338750;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=EQRZRUVgWLEXWXY2UUdHCwG6T9sZpfMFCWNR0hoVHQE=;
	b=g6Y1te4ncseq2t8hyy+I7n7zWODGoJROioUoNUSht9M9Gul5V9IpvSl4QWGJrmm8Y3RN
	 y+PxCVs0uNwjLHG5VdTAICnerPIDd1egN2LSkKR7EqWoih1Ccn+8/Ahd1vx/4H+U1Eqrw
	 HNH3XgPwMpG0h/Qp35EPOkzJjr8o05cY4qeDcEWx9OcI87GpQVx5T6+EtMj5qd/PINrmM
	 BqJ7jBKNKbyEyL9mMZkEYFRf81v4Bufs6/h20eEpR358g7ytGHI5qieeGnvIVCqR6AtL4
	 VBMIirxw+LSRwM8i0YUxs301nUEcuhc32OUzi17IFkRksAAES48ekBcveQfqYEEOmzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PLS4XcuQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA381606A32C
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 09:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA381606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PLS4XcuQ
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c0ea47f5b8so238290e87.3
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 01:12:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795338748; cv=none;
        d=google.com; s=arc-20260327;
        b=Nmwc/oVdZZqfzAlAeFVKbjw1tCbh6WuL6/TeE+YMAs/m8oVbtVtOC8Xn6jLmPbCiiN
         aVFA8l6dt18kmheY8WeDVBUujiRr66q1lGIcCICnP/lsQ1kYhgsLGKsROTszpmqEoOAj
         p9YGXTfbyy910Kk5BWuxj+1E9c6r1ZHYJjnQCFSovJSCIn24U4+wtQstlwe1Jsy7pOtG
         LVzLZ//5tyR+waS9O/DfHXPu0PwSH8sPUnr7nH7hnmT7UQC9LnuETDfj45sVCpVA+9UF
         F1IDFqREk8BjShnQjBUwlrXmOuHE40favvODbUmsz8lyba/N5HXu1Xd/7OfADTdQNu+u
         vKFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EQRZRUVgWLEXWXY2UUdHCwG6T9sZpfMFCWNR0hoVHQE=;
        fh=mKv+LJDpzBCmCMqcx7If/pZ29LvLpN/8cWh+48fyfPs=;
        b=pFrwsUcycp93iKJVQ9cPFDNQKOURwKHHjMWf3nKjt0Bh4OQpA8BZqinAAFMbGUfRi8
         S2QzAAeWawaaR6n6wMjInRQjZ3P7y1BNTKxfQuJ1LvtwEcTocXP9VEUjf6w5Yg/1cFxd
         qVjeT0pk9ClhmbJAqg5uz2PGj/2Vbxu+TlOoQvvmVBJQLUOVEYmKduJyfH3LrMUIsqv0
         +3iqVVw31U4TI54Pu3mJj6FKfVn/gA8dCA5O0NPmvSczNmsH05EWnKqlN5v/lK9NIpiM
         AsZOjmbEB7gsL2X10om3/VXnQ5Bo42sHyidH5d6du14qUc1oD9KhkhVkMYtnqtNCA9K4
         18sg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795338748; x=1795943548; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EQRZRUVgWLEXWXY2UUdHCwG6T9sZpfMFCWNR0hoVHQE=;
        b=PLS4XcuQdsaZB2j2yf4YdDnBfZ1BFyW7tN/f+hhQY5ch5NWWQ5DRG/N0qkfcHEkjot
         +6wCseLb/5VPyzjDgzvYeCeXcsNBYT13qwPPbwqkdlyO1vYivW2QRwnGfN2RO0wBaMvd
         z2ACb0g7OPqWAIgH71B6etQRkvbLylRCvlJgQ5G8J4JwMhhul/oVR036M0iowTse1OPW
         Vu2LU55F1jCM6vV9Qy5W2QAF0wBHWJluTb99lpdFL4bExaX7mkkLx5o+3O3Mbiv7tOQO
         oh7OMpDtwTqTioQF+kuyqxcptav/gxGzeFva+s9vhYMD6A50yCFCPQfsN4H6t612wgkR
         WgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795338748; x=1795943548;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EQRZRUVgWLEXWXY2UUdHCwG6T9sZpfMFCWNR0hoVHQE=;
        b=VTx7Y78xQMEac/DtuYsEsIj4dS6OcNe/1W+FfU/VEpVNtZCOk8OMwHh6L5e3KdHE03
         EcUj4LQVSv7iShYduq5DFcPaRnmFAiRsuGzrlYFl1aBwscS+lKJ2UJEoj9f+2fxfEg7U
         4IDKu95lr7mk9FPj8uDWzY4u0wsvPUrTPNUlVm9bg/xg5X4UV1K7B3poFftELf+hfWWQ
         eEBSB3OTminzHyMewST4VZ7ZAx9JF9VdpUNiEk7k5JD0HuhOtR+kctpL1RNGMVQ3HlSD
         eqsLWg65RqtDASEbQgLMRBkjfX8iJVIBNMsGijfUT+39p2vid/dAJ5krWBK/0s8UQQ+X
         ovcw==
X-Forwarded-Encrypted: i=1; AL+hErHc96apDBXYR+3+NAmRUETr9IrMlrLKr4pkYozStIhB42R8ZCHXx4MGTz/QGpSGngDafs2tk+8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Tg9FupWmYoiKQ8fH/qm8+huydmHpt5JGRIxsN6xt0qcJ0IN7L
	+jyk3FcDXjgV6i1HU+juxw6f7lmn4jFBXyZJ0zhmUdnGH/JOfkDzvfbwemJ9qaryqRBws//B1CH
	w+BNZdQlew4CnJSXIe++nj+BkuGF9jog=
X-Gm-Gg: AZFdTZdRwJ7fOsIOQ9WMbRI6MZjnIkzdivfQDoKPJ3Ix1exbnCNEphv/05Dp1ftHx9n
	HAkIUonI6bHqmlbsevkJsI5ON0Ricpb3jUkEF+9PHXgdxUQWdc9DHELwZ5a7fNvAi3y8w1YWO28
	dat2Vgkz2pVIRRQoskdU0JbioSJOa8gS7Pu+7ILAn1yqKSYXbbPKsKyAbN0gLfkFJmyLVrMW6uu
	TySscKXlwjrlBCwfhbQtHWfNkVhgb6ef8YqZ5DOutVYvgfHOutEmHPRuMapS3+ydnyfWuez625k
	pq5gRFguRsgiBiwtiDQ1LLQq4OJJRA92ZDxcHqbtyRJdrL+E9MtIjRJS9eVDR6QZ35UfqQt5mXo
	wIo0RW/o3agEcHzDSL3aLwkXngE27p97MKi2w+kpnHfVLqwe50J4YAxtPIf2Ic0ik68818jg=
X-Received: by 2002:a05:6512:31c3:b0:5bf:e6a1:3115 with SMTP id
 2adb3069b0e04-5c1bc76a33fmr3276447e87.2.1795338747873; Sun, 22 Nov 2026
 01:12:27 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121-sun8i-emac-mtu-limit-v1-1-22492842d318@gmail.com> <e72505dc-f20f-4473-98f2-52161e08c89d@bootlin.com>
In-Reply-To: <e72505dc-f20f-4473-98f2-52161e08c89d@bootlin.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Sun, 22 Nov 2026 01:12:16 -0800
X-Gm-Features: Aa3M54oySI-tTJ0Yq8ZA8YifNr7RX6205w52YmRPUl3JnSPbZIf10o3azHoDuPs
Message-ID: <CAEy9hNVyfNZu9R-2duqwFhYps9t58CwZM777yM7AmU0rcc=dYg@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Limit the MTU to one
 descriptor buffer
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, LABBE Corentin <clabbe.montjoie@gmail.com>, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Russell King <rmk+kernel@armlinux.org.uk>, Nicolai Buchwitz <nb@tipi-net.de>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On 11/22/26 08:56, Maxime Chevallier wrote:
> The problem is real indeed, but not specific to this glue. Rather, the max_mtu
> computation should be fixed for normal descriptors altogether. Can you work
> on such a fix ?

Yes, v2 does that in stmmac_main.c, with the lower sun8i limit as a
separate patch on top.
