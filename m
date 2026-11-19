Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795118530;
	b=15ANNTW+D0L53EwRuC/3WDQxjMDV3du9CQ3O2ucizePfcACm7bEwPv8UomaL03/ZuxE2
	 ZTUaJkORs/qE8HFIjUeXK9hqmHivDotc7CSslBvA9XhPdtZtpPKaJNUD+g0KSUdzrt5Gm
	 BN6GvCsCi/j1DAMcp+1tZSpozBvey2cYAjqaK9TElSp24pR0L+5lVp9ehrX87aow4mEew
	 uOdRTHiYQlAbadahzfqodvcvVrykt13gZwcjslJ5H4c5V9c8rt4FbpYtBj4t8kqa4BTnV
	 OmfEcRZQbeqMCjO1faD/d9OERWwAbVdelLNkWLbC/ANu4+cg312CnPQWXo++zvyeMaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795118530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=y4eem3MZHL+OJUpiUqcR8fCOWu+5ffSdx+AuciIXYFM=;
	b=z7rMa9KcHdhNC02IAahVRmxQfNx+1o5zMFzxZMwI3ve/gSd4qtp62dwATkddFMY4iBTQ
	 ZfWUCiDyg1LYDJe/8tG1Qp7hL4Nux2LlsqrbxPmRc5GeoQ0KEQnVzwD/iuW2GxabfEYEX
	 Ubm/ZpV2RJdUI8DKFI27kqowziQMRfbJXrSgWbm+I37TXVY6pE9d8kzCaMeK26/RuydHx
	 Aru43u4ymNmWTF1jjQQAJRG1NR6XHxHzYMiZ0RhlZrVuzVxuPxAoo7fY0z+nE0Kox7d5A
	 ++1S509D87IuTed9zANl9hNeEYNBvZmwbrqR0fiFPt6czHBP3xu9YD2F+ghr8t1HOEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M3fG1mGz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B834C606A32C
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 20:02:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B834C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M3fG1mGz
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cddc597d062so80517a12.3
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 12:02:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795118529; cv=none;
        d=google.com; s=arc-20260327;
        b=C0G506xVT+sPZiwhO1/GYNaKHMMGCrFq4zMnGD/pm/bO260a0zut37YmZRMu8cwGhK
         eUXkldXJeT7iyXr2O8kdEK5d8htDaRHWMoP3Fh4t7PU/VOPYDFJm/EHGihrNi2Ec0I/n
         tLMLzxq2HyIWzBqsPoLlzh03SYFKqxWwM/CWrUIbP9derkiaLLMjppElIVlXXJJPEfyU
         vRf/39205hT9oociins0J2Ok5xOrRTky8dOXD6W12GNHPmzsUHcGXeAKseVUxKhZjTm6
         3WliyUnOlohEVCZetz0m0CUm5WzWvCdnW87L3i9ZzubAmZWB2Pi0r83b10l9BxwiwU1B
         +YBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y4eem3MZHL+OJUpiUqcR8fCOWu+5ffSdx+AuciIXYFM=;
        fh=sQ+EqCenzysEr5Ut5l1KoT+L4GnjJnDOWmVb6+AAPm4=;
        b=KTk3WfM7lB4PzHSsWRI7iFDdKjgHJgaH8wm6HTufKinNV1bEKvKeMz0FE2tu5nI5S8
         o0I6DbsCILx1cIN6kI8sa42kRDoTGOa5m6UASYuLYkVMCyIfDJ6zSJLroJWt4ZC8/twr
         1CNhBu4HgpW8yfwbAHTd7BmwQaseQsiZqJcc9MNyS+bOR/1mHVfr8oCbkvGuP8C0E47J
         PsQHMhhiXFRHpBvaXrS987vUYxJUl7YvqhtFzeJoasOJnEON5N6vSxguP1DGBMF5K9ih
         AqJNTjdNDw/arw8QP8UbyS+yPxwUiI20nh/AM4k+B4ZNcCga7TUGIXWNeO3Gy4026PA9
         jQ7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795118529; x=1795723329; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y4eem3MZHL+OJUpiUqcR8fCOWu+5ffSdx+AuciIXYFM=;
        b=M3fG1mGzEEkK5g7tak26ZQNGKd7qs9NXAy1TMsB82Nwso+Aptx1qWQVgo8Cp4FYXXs
         6dCdZfyEfFsjkmQzyIuP7py7yWf2sUr3E6zbpY0UbPMVVG/hCDp7r6OCU8QhY92fP7fb
         2BqvEu/y6MWxscIWT87NLch2a0NRJyfbRYUnUyakxrpco96/Lry3rD4NxzZQp6WgsEqW
         6EXSmFiiNb0vnfAp0ORPXQvFq4wc1uzM3C6wIfKmNqdXm4M+9ATW+r8ixkXprK4ca8O1
         +neYtapyEwGRaPSkmGUrNeA60ooaZI3OXnu1kMT9lxs1esQY/mR+a+fbDyqa8IppPFly
         gcvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795118529; x=1795723329;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y4eem3MZHL+OJUpiUqcR8fCOWu+5ffSdx+AuciIXYFM=;
        b=k6/TD9dMjuCssZ02OvUBq0cYN4vTrcNjDhN8JqFoBfvKnVCybQfK5qA/5zRuVGA5f+
         2T/2J3HdrrvYNRGm0LexnaEofu1l3fi1+9BtghLyOwiJDyvF6cnCwMA8nUAK3hKtxm1R
         QGf9Nt8hwW7DCoDs56CX3/Lm7RooHWmXlB/jmcggOvi+3Dx2lBC9gjXen2IWk5OAIjxq
         3Ve2PLejMCs68zqkHynXqlLBL568Q/pewcjhRHEOWZAZDV7sNNDxbailNgobLDMO1Jar
         VdYHBsaymeqvRxxAiJZtzsBD/bl5Mdc8iP0XxyqqeXjckryIZfww+wYBbeehOQcARWYY
         bmBQ==
X-Forwarded-Encrypted: i=1; AL+hErGZ0Qk8h9Hy0sRrweyc8COe4wrGHBXiczL4csNgveu7P7M70j7G9gMoOdg1kG1npqho92AzwxY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sd6TAe78Hbb1Xbxea009U4fBTiAXCZwFdVRlFS+5jfQycGMyX
	3beHnTRJcM9g5BxvQQ3RBD+FxqOtD3aCxQ45uwfSq+X41ZE+rMStSxJ2kNrrOdy4aNewMPd5w/T
	q24HjTKAPRaGMtURUss2dWz0JHlU4vsg=
X-Gm-Gg: AYBFou1fzqoHkSIDJ+tQVsFTL4bGsgcUsB9wnqGMmL3fQKMN6gSlBRxmoGEai6PyRXn
	eYmVbCtCGqfuOyMgHTaZ3mDaoJy1GkP5Po8q1m9V5MozoeFS6jRC05BfHuzp79/T8JWB+/Kepd9
	wPmRCtSK9uCl72QbRzOOvqgUty+UdxE3tixcfyCw39NLqmtvcXqIcbW9WiE/CbZ9B35DA+w0gQ4
	N1QmWSKiVilWZN2Okubhu4KVEH6ufxctFkL36a4zfFaP/NoVRtDP5Ks0piY8VLPQjuJK23MHbmb
	nSZL3e9R1UH4YE7EigjIW8kdEqDjtqAu9um+8cbj5uzFhW/0+TePcML+z7lmI43uyxy2kAZFrRr
	UZQkGYZVjzb13ZDC4Q/VV0u2hUiEADs4/29AFvzTsL4s0u2jxfKUgL36hckjJISf8z9ZaTBGOYO
	4Iq5A6p0Mt1JmodDNx9ikjJ2SUwpVBFD9J7Wk=
X-Received: by 2002:a05:6a21:39a:b0:3e2:aab8:4eb6 with SMTP id
 adf61e73a8af0-4014db602b4mr721063637.47.1795118528518; Thu, 19 Nov 2026
 12:02:08 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179505710266.3511678.14017674052424733262@gmail.com>
In-Reply-To: <179505710266.3511678.14017674052424733262@gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 19 Nov 2026 15:01:57 -0500
X-Gm-Features: AclHuK_QNEvmBX1MCKcJp6gFprpzU6I8eQIOW2c22-DHXFZThro3p5SjaiyInMM
Message-ID: <CADvbK_citvtZ4eumLcx_szUvth7sQMP1oKu0mLbo0a3bD-eSxQ@mail.gmail.com>
Subject: Re: [BUG] sctp: auth: NULL asoc->shkey after a failed
 SCTP_CMD_ASSOC_SHKEY makes close() oops
To: Kyuwon Cho <kyuwoncho18@gmail.com>
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jun Yang <junvyyang@tencent.com>, linux-sctp@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 10:04=E2=80=AFPM Kyuwon Cho <kyuwoncho18@gmail.com>=
 wrote:
>
> Hi Marcelo, Xin,
>
> While testing v7.4-rc3 with an LLM-guided test generator that we are
> developing as a research prototype, we found that an SCTP association
> whose shared key could not be set up still builds authenticated chunks,
> with a NULL key. Closing such a socket with SO_LINGER {1, 0} then
> oopses in sctp_auth_shkey_hold(); here as an unprivileged user:
>
>   BUG: KASAN: null-ptr-deref in sctp_auth_shkey_hold (include/linux/refco=
unt.h:366 net/sctp/auth.c:113)
>   Write of size 4 at addr 0000000000000018 by task test/115
>   CPU: 1 UID: 65534 PID: 115 Comm: test Not tainted 7.4.0-rc3 #1 PREEMPT(=
lazy)
>   Call Trace:
>    <TASK>
>    sctp_auth_shkey_hold (include/linux/refcount.h:366 net/sctp/auth.c:113=
)
>    sctp_control_set_owner_w (net/sctp/sm_make_chunk.c:112)
>    sctp_make_abort_user (net/sctp/sm_make_chunk.c:1492 net/sctp/sm_make_c=
hunk.c:953 net/sctp/sm_make_chunk.c:1016)
>    sctp_close (net/sctp/socket.c:1564)
>    inet_release (net/ipv4/af_inet.c:443)
>    __sock_release (net/socket.c:735)
>    sock_close (net/socket.c:1529)
>    __fput (fs/file_table.c:512)
>    fput_close_sync (fs/file_table.c:618)
>    __x64_sys_close (fs/open.c:1574 fs/open.c:1597 fs/open.c:1584)
>    do_syscall_64 (arch/x86/entry/syscall_64.c:61 arch/x86/entry/syscall_6=
4.c:89)
>    entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
>    </TASK>
>
> When the INIT-ACK arrives, sctp_sf_do_5_1C_ack() queues
> SCTP_CMD_PEER_INIT, which records that the peer supports AUTH and which
> chunks it wants authenticated, and then SCTP_CMD_ASSOC_SHKEY:
>
>         case SCTP_CMD_ASSOC_SHKEY:
>                 error =3D sctp_auth_asoc_init_active_key(asoc,
>                                         GFP_ATOMIC);
>                 break;
>
> sctp_auth_asoc_init_active_key() returns -ENOMEM before it sets
> asoc->shkey when the secret cannot be allocated:
>
>         secret =3D sctp_auth_asoc_create_secret(asoc, ep_key, gfp);
>         if (!secret)
>                 return -ENOMEM;
>         ...
>         asoc->shkey =3D ep_key;
>
> sctp_cmd_interpreter() then drops the remaining commands, but the
> association stays, with peer.auth_capable set and asoc->shkey NULL. If

The association should NOT stay with a broken state, but be deleted in such
cases. But it seems we can't do it in the loop of sctp_cmd_interpreter().

Can you please try fixing it by directly calling sctp_process_init() and
sctp_auth_asoc_init_active_key() in sctp_sf_do_5_1C_ack()? like:

        if (!sctp_process_init((struct sctp_association *)asoc, chunk,
                               sctp_source(chunk), initchunk, GFP_ATOMIC)) =
{
                sctp_add_cmd_sf(commands, SCTP_CMD_INIT_FAILED,
                                SCTP_U16(SCTP_ERROR_NO_RESOURCE));
                return SCTP_DISPOSITION_CONSUME;
        }

        /* SCTP-AUTH: generate the association shared keys so that
         * we can potentially sign the COOKIE-ECHO.
         */
        if (sctp_auth_asoc_init_active_key((struct sctp_association *)asoc,
                                           GFP_ATOMIC)) {
                sctp_add_cmd_sf(commands, SCTP_CMD_INIT_FAILED,
                                SCTP_U16(SCTP_ERROR_NO_RESOURCE));
                return SCTP_DISPOSITION_CONSUME;
        }

instead of using SCTP_CMD_PEER_INIT and SCTP_CMD_ASSOC_SHKEY.

Then you can delete SCTP_CMD_PEER_INIT and SCTP_CMD_ASSOC_SHKEY commands
from sctp code, as they're no longer used.

Also, please use git-send-email to send your patch, not send it as an
attachment.

Thanks.
