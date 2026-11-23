Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795472114;
	b=o7vSJcaCFodpsTmh7Y/4vemZF4u0bxUKfTXkYvYFsRh/DDepMRPE9m26eSgaihQUby7b
	 UHDuqyDGgVJ6P7dAv5iD0q+6Uu6o7EDKnTZBt806Gv5w+hLOndxbDHhl3EkYCgsbWOvI7
	 Zbxth9CTcQ+LIK8Seb6yeReXcd5AnnHpGRskwku9mdSDZA3o+Vu9SJY3DswuwK43Vaz2r
	 lbpv7MDahFpN6aXfskalZmWE8XJ6olFQvjOzRtCRUlyM06RsrqN5PgMWYw6C2yXTh+NzP
	 JFAPQlFIwo2dxaIXVeiJAAHd6uYqX/02xlRi1k9rn1Uy+UZGU47yzVa81ZAH9IvM59Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795472114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=F2nxXw1xsNQYaaD8ZR5Wp773q2x9Fzid0kC42p4+1HM=;
	b=uQhs+nQBFlLW9w+umI8GB0DIvZARUZfowIqe4ikb0XbJZjLY7FqDkCheuzjn9R45ULdN
	 n2H0Dp6s26ojN9WSsrCRYFtjJZqFy+pkjLfvnnPbtk8oXrxp7fy6Xj0Ov0RQwWzGyNWLs
	 IGPdvAjd0iulRj390YyRBW8eqccJZMziN3QY/b8/f8ok0c89A1Pc7ST28KIT7vyFT62oe
	 nB6rv80cTu/qj8WeMRpPVSwzsA+JOYZKlq7GWVUvnwks/r81m659d+OasDCso6z3RO3aN
	 HrEawmcwLbufsMBqEOyb9PJTUUYmDgN4iXEJjJksiNx27jdITW2QJMmyuD13tZSRcpw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rAys84+E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.173
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D508606A32D
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 22:15:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D508606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rAys84+E
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4e5c8b3facaso286862b6e.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 14:15:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795472113; cv=none;
        d=google.com; s=arc-20260327;
        b=aIdLo4a5VGjiFYjsNwq6kIcGOupt6SyA/abYxRWZCPJH/76iFXDzFqtTH0Iq3GbHUs
         LbmCnKljqTpn9ZQc6H7VIb0HEJl3Mz1KkgScggAsImxggweR7asaBr0DBbYaCJ3rAhJR
         E2k4xOaxyO1iM2DnnUtM02jPkjTtFEA09m47mHknjlCUos4XrDLeNow5VIPxLCMeEvkC
         SW40RdcTQK28rENY5kjufYKvBfOZFqIbe6sfCDL+iYUFBaBU4K4vJgFOynE8KYsi+mnX
         OlBh6JpCvquCY+uYK7DrfBbGHQZMjk0q2dOPM3os1TTrck+8UtoelA8LUXFZ/jaMPKHB
         TNig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F2nxXw1xsNQYaaD8ZR5Wp773q2x9Fzid0kC42p4+1HM=;
        fh=6V1PdPu5Ly1s+lFJc+wJsTDEe4hi6kaCB8Bn91f4yCk=;
        b=Pg5NiJSbppF7Sr97uT6Cfu+CN35HJctlo8MJEtqUTeTNo8nwNRyFkYmIt+xgy5P2gz
         h3rpt270vO7Dkn00zwsM3/5dBn1dLTF5wOxf+N2AQNBJeZ3DK7E7Zj3duz8ASHBG6wpQ
         uMCGlPzOV917c9f+5Y5yH9hfj//Li+NQI1Kt4KLzZSp2mbFheHteY63DBXXhIU+pERxD
         UDd7K/cGMSbRo4hTkTJH6vPWuOOcqNUlVU2trXI9aLWtAo2mdOUii1Zc3Cz6MdWdpGpv
         lfhQNRfKtaO9GS946k94lzskD+xIj6HKcGIW+vE7IEuNWmVSFF2Z/DfwGmNVLyVrKZe6
         myyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795472113; x=1796076913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F2nxXw1xsNQYaaD8ZR5Wp773q2x9Fzid0kC42p4+1HM=;
        b=rAys84+EB0GX35CiHTLGHRvFl2TY5PywP+H8poN1n58IEwptwTqp/gZd1aNO+/jddx
         YT3RrArgIOclypdPq37rkF23TXh9he6PMtTjDhsYr/zCukCU2JFSmKqqBr+GtTe48sbB
         I53wrIsXWqH4wQfgWKOQL5Yvn9859IoS1PCIxx/I4nccvB42iOmHdCwVZSR/ab/crWeX
         ijA3qDwpTWGbRqX075nIFY2i1t+FFSnXyhJStwLPIrd5KQQL9g8reC29rOdoEzNENfsd
         O8uEhDJ8T1oEbQaACjSoUUqNfbJHo0G5cW6G9DCPuV81WP2qi4uWwelMHZk/4J4Xuh3r
         0MHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795472113; x=1796076913;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F2nxXw1xsNQYaaD8ZR5Wp773q2x9Fzid0kC42p4+1HM=;
        b=zS82ToobbKStf+DZCdFp2RJOXcBgXr7iO45Q4s8zpfC92ymVY2fkyrKd3G4YTT2oUe
         5ZrT9FTltqectgyASs8D82TuWR6SDPOq5cs7K79zh7CNBu42yAVe3HStfM0SOGYUxkAw
         J/wKfNP8chG4H8hSP8QNCEEIyTUn2nOKLiCbD4UzgXNyzPtQhTHB7M3GohE43cYLk0GQ
         5CcOJqEJOXOkRrYolM+uIcjdypU5NNYSMOcJ8Iu/pEyUeYczYbO/TrZkKv2fuwrGw3/7
         HL7+fCDF1X7wVlzMpc86tAoketg08ZoFXCzBBnFaQ9xBV0zpTlHCy4PoCl5KIFrsG7h1
         kXeA==
X-Forwarded-Encrypted: i=1; AL+hErEmZkualCXGEY7kKLfzbEkvE7IKzZujl3RIaDFVkuDdsBVK3V2d72P9jltPai38rDf93XwjlKk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UE/vwpQWUWNQhrxn5T/9+zKRzMd4xjg3paoz0+P75+u3jeqig
	8zudl92nQguqXLfyX9WKVyRGCN8htOf+oEdVlrxLk7G/Hlz7mk/Xt69qik54S1WvchOq3E8oXrL
	EqEDRoPS60icJt/Vjaog/c0v96+1zR3s=
X-Gm-Gg: AZFdTZeywfoRPs4HGtYbJUgvvTjlGB/i6Dr1Bukk2MFEBZqgMECT50i1D3WCfWaVzlE
	VSdCCcLqgSPrkBWU+uk0KPKduIIJ/hHVNazwe7aW9gJQKfX7/FUCYzYnILNMt4UAQLt7+wQ3kug
	9a9aF4SB1VRQOJBaqtxlnDu+ptWtVP01BiqTYrf5O1VHFwoRDGf16mh76YHvfjeRtBbEKLOMfz7
	eBmTiDfgVZjBgO9NFyeIxt+/eWTkYT3lMUvnUHKHV9NQs9RR9+4zwu7pOARB+v868Qdbb+tFI9e
	8dSVi9gACL1JFRmuI+D+q1m8uLrxz1JsjCHx9W9rwbJzNOQ6pbEsXRHDpHXQIneSIi78v8KGDLU
	gD1OA7CNUxubUrO3fK0cGNgfMRA3tuGa66ZWEYZGhSIfNeM7+e98zhQ==
X-Received: by 2002:a05:6808:3199:b0:4e8:b729:3ebe with SMTP id
 5614622812f47-57a0b953d28mr19799401b6e.4.1795472113383; Mon, 23 Nov 2026
 14:15:13 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121163557.963029-1-john.ogness@linutronix.de>
In-Reply-To: <20261121163557.963029-1-john.ogness@linutronix.de>
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Mon, 23 Nov 2026 22:15:02 +0000
X-Gm-Features: Aa3M54r8PgRgIYfuYsniaBnSQY5MIggTDgAoabLc7fQl-pQOC2s44IKG_HVebgI
Message-ID: <CAGSyskX=DHDJiUxWOqG5_rYhA=OGoHbe_=GtGbOPsGPfgZAonQ@mail.gmail.com>
Subject: Re: [PATCH printk v4 0/8] Introduce policies for unsafe flushing
To: John Ogness <john.ogness@linutronix.de>
Cc: Petr Mladek <pmladek@suse.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Breno Leitao <leitao@debian.org>, printk@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Rio <rioo.tsukatsukii@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Bradley Morgan <brads@mainlining.org>, Pnina Feder <pnina.feder@mobileye.com>, 
	Alessandro Carminati <acarmina@redhat.com>, Gal Pressman <gal@nvidia.com>, Baoquan He <baoquan.he@linux.dev>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Dave Young <ruirui.yang@linux.dev>, 
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, Oleg Nesterov <oleg@redhat.com>, 
	Bradley Morgan <include@grrlz.net>, Alex Elder <elder@riscstar.com>, 
	"Cen Zhang (Microsoft)" <blbllhy@gmail.com>, Petr Pavlu <petr.pavlu@suse.com>, kexec@lists.infradead.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 21, 2026 at 4:36=E2=80=AFPM John Ogness <john.ogness@linutronix=
.de> wrote:
>
> v3 is here [0].
>
> Until now unsafe flushing is only performed at the very end of
> panic(), before entering the infinite loop. For other situations
> (such as panic-kexec or panic-reboot or emergency-reboot) no
> unsafe flushing is performed. The reasoning for this is because
> an unsafe flush could lead to fireworks, which could prevent the
> kexec or reboot from occurring.
>
> However, some users may be willing to take on such risks in order
> to see panic output. Indeed, for the netconsole (which does not
> support safe atomic printing) it is a regression that such unsafe
> printing does not occur. [1]
>
> This series adds unsafe flushing policy flags per-console to
> allow individual consoles to perform unsafe flushing for such
> scenarios. The unsafe flushing is hard-code-enabled for the
> netconsole in patch 8/8. The justification is that this is not
> less safe than the legacy netconsole.
>
> Later these policy flags could be easily exposed to userspace
> via /sys/class/consoles/, once the sysfs per-console interface
> is available.
>
> The first 5 patches have no functional changes.
>
> Changes since v3:
>
> - Restore WARN for non-panic hostile takeover attempts and
>   expand the comment so I don't attempt this again.
>
> - Rename nbcon_allow_unsafe_takeover() to nbcon_allow_unsafe()
>   because it now allows general unsafe usage and not
>   specifically hostile takeovers.
>
> - In __nbcon_atomic_flush_pending(), additionally use
>   panic_on_this_cpu() to determine if a hostile takeover is
>   allowed.

Thanks for following up on this, John!
This version looks good to me. Netconsole needs more work before we
can have a completely safe write_atomic(), but this will allow users
to make a choice between reboot safety and observability.

I tested it triggering a crash with and without kdump enabled, from
normal context and from NMI context (simulating panic on hardlockup).
In all cases it fixed the regression: messages were sent correctly via
netconsole with no unexpected errors or warnings.

For the series:
Reviewed-by: Gustavo Luiz Duarte <gustavold@gmail.com>
Tested-by: Gustavo Luiz Duarte <gustavold@gmail.com>
