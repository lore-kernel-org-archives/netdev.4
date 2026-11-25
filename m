Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603347;
	b=MQR/DFChW0mmuctYom/TdK7C0f1AkCoOelCa9DHT26XY0WibyByQJPWNRLCkx00zBReW
	 qpFX5mVBA+6raydEzqmTVUZjV6gFuHV3aujgoDoc86wiaxDHnuIR8I1kUiELOMhHdrK3Z
	 mxqlpUUoDeDxQjjX1vkhqH1cZYKancN/gOwwMOZF+caEIitfTWr5OFBHAnPJKd2cn1Jwl
	 TLO5jRYLo+iKnCk6ugHh5uhY8ZEvTtIgyQOlkr39590/ezJX9mMgKPQnONr78Y/mqPS0H
	 dSphxe0sYbXmjLM2OmkfRelShfbZBGhz08QlxdmbQ5CvcUag+2kK3ADslGGiyQ/gnkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2itv7AcVBputKhN6p3kMxHNEdUzZvUrvuaoBxgjz4ao=;
	b=Z7MBYRFIrAnb6jHn6A+/mBQ9XFDuojUD+/KJlTJmprLLxZ3r3yAFp1OJpsUAUWLJVlzG
	 d2nMu3ReCUHnzV2C4gyM54AwVOI9H6cNqoIEeVZQZxN50iK+yoB+iAYX4DOH7TGvRVp+q
	 4KcFpsLa0QEhuWHNhzmqo3ru7GiFPmEF1GrvjaYwSxAQxKut18kZDmho6EzF0JDV18Wsd
	 p27wfzbrX+0JHYGV+dYKolFDVqj6dVXjjuyMY7ZiL32KWcugGLcCdJg083u0ORVtbgCSQ
	 jT/JZ9FVhwOB4+NFPVJzyzO7V0Ry7XJYgnETCcag71euFHxx2QmXUmAC+8ZTYpA0Gqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GTOC9omH;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523B8606A327
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 10:42:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 523B8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GTOC9omH
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so48464875e9.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 02:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795603344; x=1796208144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2itv7AcVBputKhN6p3kMxHNEdUzZvUrvuaoBxgjz4ao=;
        b=GTOC9omHlN755K9A45vsxlj2kZzH2TydJr26tT2j1VdKH9AuU2YpjdDZrdVu+PvyNw
         FjD3/41LirizaeyE51QeopzgMvhb00wccT5F+DmamieIWvGOpYd8mhXlkklBrAqpUEPB
         eX1cFlBg0IZ6I06TcveXFCS1CsxjnhOYxeTOJv/4P/fYS21byIWQa0uWI0wcCYEoJiY7
         I3xO4QUwcocd5fZN31rbnVLiZejYU+mGtwBRIKZNz3IGyN1ZLOE+eEorxL5pA/9p7YkJ
         6/w4cqjt8ZnhZ/zTdb6HCv5SxBGWFIMsWYgQeArmIA2xsnkr7bLOSmuHz9mG4+ftnZsX
         Qaew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603345; x=1796208145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2itv7AcVBputKhN6p3kMxHNEdUzZvUrvuaoBxgjz4ao=;
        b=Z53pHsi2bGPCKhU3TSL2pe5cl5uVMVxQcH6uwyWIn7wCBSZSi5FqQw6usqWzkw9lyO
         bxc9s8WlWdRXdus9112ox9+AVWHY1PZROrnbCC0oy1+kuIE8sBgTYk7swl7p+NV4sb5x
         W/K0zcl4vfmh0DyqnI+USAAV0YDEjJ9tdK/2qO/S4Dk4vk+FVFXpxIfAGJti7Dh+eK80
         PF9EN1du1uEjY6NHyiNIDdo8azWzVK14mGYDZuibj6Slyw7mCnDf9/s4IePSxwhBC6JC
         OaVwas1Wl6izPj0EiNKztNBQzjjW2ftL10k+mKkdumsk+/ZW1ICnHl031ZC0MFa+idov
         kFvQ==
X-Forwarded-Encrypted: i=1; AL+hErGXhNyWamPkfhyTzPS6reG/ytSGLk1HYzhoUhTnYcteAUHdeqTZbLFaBqanTJAjwaxDjIRYlFU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hbwx+kXcvMOb3pmdpE2X6OkWxWKtSM8TCeq6qfha6Skv0sWN8
	ktk0h55Tc95WzX8RUDitGysSlPQxZpbJzMeLYbVv+jodaVU0PvN188DAm2xipw==
X-Gm-Gg: AZFdTZeQbbM9gw9c/WGTiCEvBrPySrBoS28469PYiBsS8xC5FFgxAerOe6TwXQjRRYz
	RbRRLj8JWYZcUQMTw3ifX8dQzh+LgT4vwSIeF8A3U0dBN0bPUHb2UnSZjHPYTeDHODI1PuHjjhn
	rcs4iu2A9LiHhk2kqbhFsGnduBC4eyBqdTryRz/Nd6EXqPJbySX/WScym6v8P8RseFbBLs1vEKk
	dq/Qo5KU7R3tPDDOV8E16GEx9Ip1YJB19uEyt2D6/6xXHAVv6IjTHd+5NKYb7eBw958OXfXn4AD
	Ed3MaljjEjXOuAKuwt2h0mhkyG2QQy1b9raccjyRZ6Ag39I+aqHyx1OyU+b2M7za4yYm31Kv7Cx
	Ad5Ld/ONErGFIQYII4p2C3ejujBwScU197u7qabAooREoIQ+BDuXZWMQ3uTU941bKsS4d2wicOh
	WXsHunGmEw93QsIc9ImVjMggf5FmFMNrg5hMClBBhavyo6LoiDO+f2SYOYL/Q/C9n181VNhlMcg
	XIOopX7q96kjw/Fs8bhN4M+G1bw+/kZH4zhq7jg7kBtH3l7hx0FF0Amvm6N8g3KTfI32VnsdMLE
	2o0GxweGDGdl8/78VyEqTXFMcxT9GdW+D4v3vn2tvspNsdAz+BIRnvnkUe3RRCF7ZRm+j/RC7Q7
	0wd2I6w==
X-Received: by 2002:a7b:cbc8:0:b0:4a1:d49e:9ce with SMTP id 5b1f17b1804b1-4bb860f6ae9mr298157935e9.2.1795603344300;
        Wed, 25 Nov 2026 02:42:24 -0800 (PST)
Received: from ubuntu-f6bvp (lfbn-idf1-1-304-238.w86-195.abo.wanadoo.fr. [86.195.26.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2050f1sm33160630f8f.38.2026.11.25.02.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:42:23 -0800 (PST)
From: Bernard Pidoux <bernard.f6bvp@gmail.com>
To: ertanuj96@gmail.com
Cc: Greg KH <gregkh@linuxfoundation.org>,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	ralf@linux-mips.org,
	netdev@vger.kernel.org,
	linux-hams@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] net: rose: fix OOB read in CCITT facility parsing
Date: Wed, 25 Nov 2026 11:41:57 +0100
Message-ID: <20261125104157.265662-1-bernard.f6bvp@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026112418-freebee-tasting-68ba@gregkh>
References: <20261123183818.24508-1-ertanuj96@gmail.com> <2026112418-freebee-tasting-68ba@gregkh>
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

Hi Tanuj,

Thank you for the fix. I take care of the ROSE code in the out-of-tree
repository Greg mentioned, and I run these modules on a small ROSE/FPAC
network, so here is a review.

The bug is real. rose_parse_ccitt() never checks that the 0xC0 entry
fits in what is left of the facilities field, while
rose_parse_national() does. I reproduced it in user space by building
rose_parse_facilities(), rose_parse_national() and rose_parse_ccitt()
unchanged with AddressSanitizer: a 4-byte facilities field
"00 0F C9 0A" (CCITT, DEST_NSAP, l = 10, the 10 bytes missing) at the
end of the buffer gives a heap-buffer-overflow read in
rose_parse_ccitt() (the memcpy() from p + 7). With your patch the entry
is rejected and AddressSanitizer stays quiet.

Two points in the commit message are not right, though:

- It is not only 6.12 and older. 6.18.y has the same code (checked in
  v6.18.65), and so does the out-of-tree repository.

- The data read past the buffer does not reach user space. When
  rose_parse_ccitt() returns more than it was given,
  rose_parse_facilities() catches it with
  WARN_ON(len >= facilities_len) and returns 0. Both callers,
  rose_rx_call_request() and rose_route_frame(), then clear the call,
  and the facilities struct, a local variable, is dropped. getsockname()
  and getpeername() never see it. The user-space test above goes the
  same way: the WARN_ON fires and the parse fails.

So the effect is an out-of-bounds read of up to about 20 bytes past the
facilities field, and a WARN that any ROSE neighbour can trigger from
the air or over AXUDP with a crafted CALL REQUEST, which means a reboot
on a system with panic_on_warn set. That is still worth fixing, and
your two lines are the right fix.

As Greg said, please open a pull request at

  https://github.com/linux-netdev/mod-orphan

with the commit message updated as above (and the answer to the netdev
bot's question about how the bug was found). Once it is merged there,
it will go to the stable maintainers for 6.12.y and 6.18.y with the
next batch of fixes from that repository. If you would rather not deal
with GitHub, tell me and I will carry it there with you as the author.

Reviewed-by: Bernard Pidoux <bernard.f6bvp@gmail.com>

73 de Bernard, F6BVP
