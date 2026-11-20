Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795192669;
	b=42o76v3hUKy05r8xuH4bPPluAIkr+l1X17dLJ1WIh0r8ZeZeikaUyyWU3/+X5OoqjeEj
	 x8w8lyfw3t6XzKkYPh/JqOK38WoYv7aJsOVa17315HZIi01a7mOYN2lsCcRWJpXTTwiV3
	 N8JlrlH2Q1E+E9tY0nYjPRtlG7sALkJ326FBa/z1qZxt+V9Flhbgz5+SOb1LT/hG+nrxy
	 kZUJ2llr9U4+lK5PKWLS3xZaEygUJ1iRbT3flMEj34NR4a4brwo1ZODVT8kGFBWbg3Lia
	 KpooaZt8NHpS0XCQsk5LnOjkpd5rlSSAWOgkEcR+SdtbdicA0ccL/5N8gSmmKNleVoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795192669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8gVVdRXDHaBUhqI8CsaDjorE6ggyqAZgC0sVv6G0dYk=;
	b=ysoXVav3FpusizVcdeHLchtTlBbOzGPNOqZo7U+kBc0sq5ulDk6AUbC19li4CyrIcRc4
	 GvwtCGTjC9UWuv7DDfcm+wACDkBpnhI8T12l+Vz6S4+5PhvND4v/aQcJbmAJJP0U/Sa7R
	 Gb7D9IH8WTAkDdfF1ZqTNcoQDzfE4cpBRRiwciwlVRtKyCVlyn6LqYGps3Jcp9XX1aA9T
	 Dkfv8WrdxnmT0jf7WmykkHlDBWuZf4O9srZws94sOEJk7We4ZoBXpP4UXPe1erz60Sxoh
	 4t6XsQuVgIK8z2hvnIiFzHPk+tIEPrGlbd6/G24kPVkLAPp5xeyci5oVbKxxyiQOWTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZOiu824+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC0A606A333
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 16:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FC0A606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZOiu824+
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8b66d1a08ccso850059b3a.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 08:37:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795192667; cv=none;
        d=google.com; s=arc-20260327;
        b=mdK30AuHFeOCDhpJ8Uk/HyXDXh9rOqUbH6lV34ucv+NE+8Q7PYO3qWdVznF3DiC49o
         bcLWISu19WT/f1FjnlklHon3HsfQFCAre5EyhTEcc8lGNT+uFyh/dTiRW2ViOV1ixSG2
         T0WYdszhresdG5iatHcYDMUntLoNE/7Bq5Eli6Yb6B1OmDRPuE2kLH0a7rnAjUn/HdvD
         atVS8N3n9YRNMQ3ivCZPeF2XeOUUtSVqSR8P/uE6AV6+kPyuFPZFYw+xcfY0jFXifZWZ
         /i4qxQ6EYsA+PZzl3rK/rlReSM9wTVoMkBQ5XWuMya4iAYbZLvFEFstnAqeZ3CnlaAvG
         Eysw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8gVVdRXDHaBUhqI8CsaDjorE6ggyqAZgC0sVv6G0dYk=;
        fh=z8jk6RE/NM5bh4P5uSk6I8shkgELbPrwIzorNJhn2AI=;
        b=mGFLX3JZhGyHoafZh+oMNtILEvHGsh3W07yZ8c+XvtW9/LpcovrzG5WLl6UwlmO0xH
         iL7P+AAppRIU67lbCLQecYUKmhGUalTkL/aeQab3uo/DpOWFDg33p8i03Sctt4FJunF8
         1WfvlRk2dfo7GmLigMmu1Oj4ZxlqZAEoqHY1bs5L7jzPXw1iDLytKrsm6DolAi+u3Ro7
         L0QrkPCsejTyf5ps/VL+5Vb2rGPkuzOPis/tCdKfP9H6yGN8+JLwnJlduR4VUmw+qIiv
         tZigabZ42mm0kxT4v9RMb73Kp8MVfQOXSTyU/LxAF8DWTgU9VRY0ixYKu3pzl8SWBnUP
         629w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795192667; x=1795797467; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8gVVdRXDHaBUhqI8CsaDjorE6ggyqAZgC0sVv6G0dYk=;
        b=ZOiu824+Qzybi4tCeLzrG2HfbR7LqOAvhjxtrLtycpDDlq5EvcJyn4toRCyBscyObG
         2F3FyeyAse5cYOzzflbdnEcBAXNCHUklhH0M3CNUJAJBrGiheGthMtGLB+4AzMK7voLO
         3PNSaKexaTcyBJ9ErwP0nWqVCqJK9Ai9tuRUpEKVZ3UGeYWKQsG/09x3la4TqHdesoHm
         N+BqgDqothmocsIqqDFAcl0OcZpKk9P6XH99DiiPzydVWtUDABK982SCGULWGF/s6B5C
         VPAUJhGNRfpKZg8aLC3X87wtQ7eL1lmIEUl50SFmUp+DbAGAyoKjf/abnBqXwUaKPuZD
         srEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795192667; x=1795797467;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8gVVdRXDHaBUhqI8CsaDjorE6ggyqAZgC0sVv6G0dYk=;
        b=D6V8DfX1BB8L1w4ZNcnHs3aruM+jHOZpzQuZy7eDAbTCbkae+1WlBm9gczTGjvuXJG
         sbbX2WyCK8kQIXYk3NfYsYVGHWhpxMZlvqez+AlxEj312GPGgxI1ffEU7XZE4mSLxka6
         jmb2H+yHHmwVy9N6ZfIZb386N6WjPTGXCTB85HV/FQ7yMJkw4G3l8UM9Y30LXG0docTG
         sBcE8/OjQU6hVnYXaNVbV7V3fb1XHvJE5V4JHwBTq4jdR6YzT0rMC86YYtmenPPsF8xJ
         DJtwHHwxF3qQTefLHREKwQBPRhWTMBczyoXMu3R0fMyO9lBtO4TDC/wi04eCDYbsY6ti
         4ICQ==
X-Forwarded-Encrypted: i=1; AL+hErF3so2xOa8toqv/7ASszFeA4BlOgSIzxwGavxvG+C7wGbxeZYZsYZn9suXBCFAO2V5bSXA9ywY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bJ5mcSvE4ckRkH7uRHHaU4JVtpkNEG6S2x4WDX7GgJMd5bIxz
	EP/DIRpo4QAsvCAEg3Wv+aGUAKWLdwhCQiWl8n3euSBzU+W9m6JbOZMcz+/mEDPshuuiR9cPuta
	cI5pBGnI9yB6ryw7B08lkObK9A5a9FAo=
X-Gm-Gg: AZFdTZf4KZrVIPf9QPfg5CisNJ3N456FqXmeRW7RZN05b192XC/wGMHFxnUsmiKl2pJ
	SeQFZRx/W1XDPJa2PHUSnHzLsXGOqdt9ejxvbWXTPFpVaCwXY72mWmcXGiCDMCuiFi1ybSB43r8
	wrhtZJD1BW7Wl5beFA55pSootWejZIHz9LwL+q5TmVpJO1kipXCVRWSjltParVzSSASHBaov5Na
	8qHwNXb+0yRBxXD3gtKt6iAqDlmLGgnKxyNUmnLOCsM6djXbJWT8vX24Z55WcesSr/lu0CjTcXu
	N+WusLjgIhhLLacueXKP+qHII5i5zA2KpsxfRtmHcxSq2Hcgmama9jW17in0mYwC1mxIECeNrDe
	ZfwYMadJUklK/M/t+aAP7yZvd46lwb4Xxgy+Eobv2xD7XXpiaAcj1U2hhwMxQyRvdgXfhWisGvV
	nViZyEVzY3yWS/WH+y3gcGclILpfLIk9tg3oJH9A==
X-Received: by 2002:a05:6a00:2987:b0:8b6:3e44:8aaf with SMTP id
 d2e1a72fcca58-8c87b4ee9c0mr3361079b3a.20.1795192666568; Fri, 20 Nov 2026
 08:37:46 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120050108.426545-1-xuehaolin@uniontech.com>
In-Reply-To: <20261120050108.426545-1-xuehaolin@uniontech.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Fri, 20 Nov 2026 11:37:34 -0500
X-Gm-Features: Aa3M54qNypMyBmyBYevUfk0cK2R-oXwezfsszARlwdxXW7NeEApwkkiP6N3Sz0g
Message-ID: <CADvbK_fKB1P4c3KkZobQwGc84snyZG-b7NYXi7xPwN04ojcW9g@mail.gmail.com>
Subject: Re: [PATCH net] sctp: fix race between sctp_sendmsg free path and peeloff
To: Xue Haolin <xuehaolin@uniontech.com>
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, linux-sctp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 12:01=E2=80=AFAM Xue Haolin <xuehaolin@uniontech.co=
m> wrote:
>
> From: Haolin Xue <xuehaolin@uniontech.com>
>
> sctp_sendmsg_to_asoc() may release the socket lock while waiting for
> sndbuf space (sctp_wait_for_sndbuf) or connection establishment
> (sctp_wait_for_connect).  During this window, another thread can peel
> off the association to a new socket via getsockopt(SCTP_SOCKOPT_PEELOFF),
> which migrates the association by setting asoc->base.sk to the new
> socket and moving it to the new endpoint's association list.
>
> When the waiting thread resumes, sctp_wait_for_sndbuf() detects the
> migration (sk !=3D asoc->base.sk) and returns -EPIPE.  However,
> sctp_sendmsg() still calls sctp_association_free() on the migrated
> association when err < 0 && err !=3D -ESRCH && new.  This frees an
> association that is now owned by the new socket, leading to a
> use-after-free or double-free.
>
> The connect-wait variant was fixed in commit f14fe6395a8b ("sctp: fix
> race between sctp_wait_for_connect and peeloff") by adding the same
> sk !=3D asoc->base.sk check that sctp_wait_for_sndbuf already has.  This
> patch applies the analogous fix on the caller side: guard the
> sctp_association_free() call with asoc->base.sk =3D=3D sk, and hold an
> extra reference across the guard check so the association memory
> remains valid even if the new socket is closed concurrently.
>
> Note that the sndbuf variant of this window predates the connect
> variant: the unguarded sctp_association_free() in the sendmsg error
> path existed before the sctp_sendmsg_to_asoc() refactor, and the
> sctp_wait_for_sndbuf() sk revalidation check was already present in
> v4.14.  The Fixes tag targets the refactor commit because that is
> where the current code structure (sendmsg calling sendmsg_to_asoc
> which sleeps) was introduced; earlier kernels have the same race in
> a slightly different code layout.
>
> Discovered by manual code inspection, following the public report of
> the SCTP local privilege escalation (Xint "NGINX2Root", 2026-11-18).
> The issue was not triggered here and the fix has not been tested
> against a reproducer; compile-tested only (make M=3Dnet/sctp).
>
> Fixes: f84af33138a8 ("sctp: factor out sctp_sendmsg_to_asoc from sctp_sen=
dmsg")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haolin Xue <xuehaolin@uniontech.com>
> ---
>  net/sctp/socket.c | 25 ++++++++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
>
> diff --git a/net/sctp/socket.c b/net/sctp/socket.c
> index b5a57f61ee6d..0039c54a55d6 100644
> --- a/net/sctp/socket.c
> +++ b/net/sctp/socket.c
> @@ -2082,10 +2082,29 @@ static int sctp_sendmsg(struct sock *sk, struct m=
sghdr *msg, size_t msg_len)
>         /* Update snd_info with the asoc */
>         sctp_sendmsg_update_sinfo(asoc, sinfo, &cmsgs);
>
> -       /* Send msg to the asoc */
> +       /* Send msg to the asoc.
> +        * Hold an extra reference for newly created associations so the
> +        * memory stays alive across the migration check below; see comme=
nt.
> +        */
> +       if (new)
> +               sctp_association_hold(asoc);
>         err =3D sctp_sendmsg_to_asoc(asoc, msg, msg_len, transport, sinfo=
);
> -       if (err < 0 && err !=3D -ESRCH && new)
> -               sctp_association_free(asoc);
> +       if (err < 0 && err !=3D -ESRCH && new) {
> +               /* sctp_sendmsg_to_asoc() may have released the socket lo=
ck
> +                * while waiting for sndbuf or connect, during which the =
newly
> +                * created association could have been peeled off to anot=
her
> +                * socket.  The hold above keeps the association memory a=
live
> +                * across this check.  If the association was migrated,
> +                * asoc->base.sk no longer matches @sk and the associatio=
n is
> +                * now owned by the new socket; freeing it here would lea=
ve
> +                * the new socket referencing freed memory (use-after-fre=
e /
> +                * double-free).
> +                */
> +               if (asoc->base.sk =3D=3D sk)
> +                       sctp_association_free(asoc);
> +       }
> +       if (new)
> +               sctp_association_put(asoc);
>
>  out_unlock:
>         release_sock(sk);
> --
> 2.43.0
>

I think this is a dup of
https://lore.kernel.org/netdev/20261112172149.27355-1-yves.bieri@theori.io/

Thanks.
