Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795196136;
	b=BRBzYrEaOgTEgPl+jOf/Qyxy+vK0fKSE2hxnvc1XluBo6piNFHZhyjEnynIBxBuH2AYY
	 Rjrzk452zn6mnMHX5XFdYPgoCjWVgdDKHc8gSyMu6KGiICNIvBowbj6kWLeMQGeCff19u
	 9YrY69BZkP6uA0qqEIpCWlqx0H41CLhTe/JHxSw5QqBDSE96jJgrqvEIup3wGFAr+ieZv
	 flZzoDsKqro3azTe1ZFNB06PVnVo5SDtKNTdOXOjOoU3dC9neAI0JZnovxv0wq+PUXMWA
	 99P9NKn08W6DNVaarBvcHdWs/KyB4+dRclW0yA5lDv/b4uGKbYIiPZyul+/w2gTv38w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Sg9wdreYArJWqO177axMWEVER4eAxW9Ay7LMmq1t6Eo=;
	b=PA4UW5TnOi5WP21Z7GvEwjeEBkewh/ssg/R4un8T+Su4Dgq6eO8zQgFCKEinKfsa8jfB
	 MYjGum0sVsIGRbYBesYb+OOC33JUSGPefeq+jy+rQCmwpp+Z+NlTjn2WB5JcaLjfhkMOu
	 wViR2T1voKOOWt8hoJjbgEYUh8y4iwi70vLSZHm1x+c4UrxxACIM3QcmM/vqsQAOH+0yq
	 xYpNOcPsKn9Dd4gah+SjVp1sx3tTd+tGE8ArVta0rr6ja5UUcxhv66wC5JdB07mMqCRED
	 cmIv/6k8Gap3LvglPwOqyshadz4B1f8JswdqYoYpyDjcde+ny8t0Sj0OdITh8yJEEVg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="jJRLKT/l";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B954660A261E
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 17:35:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B954660A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jJRLKT/l
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-533202fe429so374461cf.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 09:35:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795196135; cv=none;
        d=google.com; s=arc-20260327;
        b=d5b19IiSgLGL9KnFlcq+efBeRJw/UqYxlj+YKECGGn7yoJZVRdljGKUgO+db65B3pF
         EnzjeDXHasLZ5PmxiLCgbe8IINBpx0Y/Gx1IHWL4UzoXVV6YT+KTVWNeSF/8fCOnCHjp
         G9EvoUeN/e+9ZEYAP8AWP9rKcH5EWJKS17XTE5pt88Ws+4KkvLRiWcU9AsrTA17BjtBl
         8wMUys04sSa+7XdyCn1vtv9Z9032T+qmWGRcyMed8y/Nb0eZdTjfDQifUJQnY1woSBNZ
         1dESDQDHv2Wstspitd5utUd+33rAT6kTli2+Kdfg2kKAmxuQ2Qoo6El1BxmCjEXlq+y/
         Lhxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Sg9wdreYArJWqO177axMWEVER4eAxW9Ay7LMmq1t6Eo=;
        fh=paZPjd3BHb6XKwvzWgfN6tCsfMZBB4IbGCM5UP7qavQ=;
        b=YRRqRRo3MTYU2iXCUd/5TJqZYYhZURv5pHAgDopcdUuvVrJRogh7MYDmNL1kfb65uq
         yKQGfZlFgLINfy+vu4JSjObEbdU8bIsOfEbb8W7/ypWrdKjGRG8s/OjK3SiUYM/rdVSL
         rKk99WjAa1iUab7mSyPA0Ii1sloMyV9Y/MrPeCGacASyjx/3RTVNHo1UD8o60Gz9uj71
         jK+oM/S4m3d+7VV3mijeJvqNxmBmHCts1PbNQaulAMlQAJsfTg3cQUu1tpYSYr+luJNs
         054yEsvBBOPkolfc7WGNygluWJix7AR39v1NwFiuD+tBOLRsbjwq+CGt5j9mLuR8m/+R
         ElpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795196135; x=1795800935; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sg9wdreYArJWqO177axMWEVER4eAxW9Ay7LMmq1t6Eo=;
        b=jJRLKT/lraFpDKgal3v/eW8XSXnxpwL0mki586jbw9Ogu3xBigwDAQ7MtIfOQ1d7AK
         NkQMWlI5iCCo0VW+PmB4RZ3M4KLjeZeiQ3tZjS1vomO67l2BdsjeLF/CTGkUNkscLlVN
         ILE2sm2Vh7PP+pfyM8tytpce7a1KhESmF7nHNU+zguVCEctrLuMFggFpZ5KlQJV/gpQV
         PM9HDEjuLFBDqRRTFeGcvw+DBebCdT5T+pr3nWfLGAcQGKPxDqMPU3yTkl37rCi5HJJH
         ElUcKpyKeYgST7+hP+Krz3f+4oivPVk5dqqKDc2XBG6Q3yszfd1v0JdkuORBx9lbz6n1
         f9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196135; x=1795800935;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sg9wdreYArJWqO177axMWEVER4eAxW9Ay7LMmq1t6Eo=;
        b=ZxGqQWYe2gEgxuM9y6YH0d33xxaRk0521aWut6B4hJsJ88HAXoBVNzKrdyt6blwH6t
         0nJTkswDaB1cl08xsp2TJlA+Jr7Pq0/0UBSRHMk48DqK4eJj9a7wLqpZtOrIxJ6Ev9wj
         g19De6j29CEvV0H38KldbSoaFXYTkNVeSqqa9Wk/yl1xHEZ5oJ5x9Ck5fjAA5pcZm80A
         zFssaAU7PDXzmxcnblPnq+zaTj+paTJ9di5ADAVEWHxyyzmr6PqOioH9Q/VLYx0e+CqW
         eHUmlWTiY3CG1UqU4O9U9iTC1P5y1ylP1Wzrc9CEIhNmSgwt/0zL27nbrB/P3Otq4/ct
         C0PQ==
X-Forwarded-Encrypted: i=1; AL+hErGGO7tFR8NWAhd3fa12WPLVvlaGmD9I4Dk1QTBFpOiCGz2AZlOYT7T1eHmjXXEtUyfSPnE44vk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kNQfr/qciavcXOinvZ4I6+cqIzW6+xtmN6z2mp2OPf92IMHku
	Ro/QlvpWbnDSIhIOzuQ5knFecGfYzk+GCWEea+aYLxuPHCFQ/wZwR3iwaGtxeYTw0g1Q+p8RSxM
	zP4DpQiiGBUza7TFK/EKJozKsc+864xiwml3wtRmn
X-Gm-Gg: AZFdTZcOi8ItT9cQJ8nos8n8UQhs7K32o8XASeR9dcXDBi5AZ4gQGc00fsp/ZIebyWK
	Vo7Od+/JHBXMNGobU1iZn42Mh17D9vAzYkzuVeZLWZm3b+qGSrjBhFK7m7uGqRn3NeJh4aIzY26
	9gMMPeqkAKpsJoLVHbPJmwfn34c2qQgNa4NV44T4wyEvno6Z3MR4+ehhglMF3HQTga5m+0FPPn0
	TBokPGdXOy1PEezCL1+NV1c8lk33Q8WJs4YmEgLDWvNBsR8K1ZdLiVG78Hi52ppd/+9qAvE0Rb6
	HjAzNGTI+ZLI45d7+boLfdXuJ7SJTCelJpSBiP27fFzaISaRMuS2+TRmj25k3+UMMrXVac5Lj1c
	PiZsW4jueld2H+YOF1CSGzRWP+DROhwwBcGKJ
X-Received: by 2002:ac8:5c8b:0:b0:535:30a:76c7 with SMTP id
 d75a77b69052e-55d790b2edemr23784471cf.3.1795196133385; Fri, 20 Nov 2026
 09:35:33 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119171014.1534691-1-irogers@google.com> <f712f16f-dd35-4afc-81db-4e93232846aa@bootlin.com>
In-Reply-To: <f712f16f-dd35-4afc-81db-4e93232846aa@bootlin.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 20 Nov 2026 09:35:20 -0800
X-Gm-Features: Aa3M54rHxE2SNl4cgtQPI_-lngqTQPH9-vUoYkTGGDewMSKBXdmwHC7t9x76wtU
Message-ID: <CAP-5=fUPWc5GH6BQsN-+Di=LVb=dYcUu5Mo04Rp2ugsMzjYFEg@mail.gmail.com>
Subject: Re: [PATCH net] net: pse-pd: pd692x0: Return fw_upload_err codes from
 firmware upload ops
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 9:26=E2=80=AFAM Kory Maincent <kory.maincent@bootli=
n.com> wrote:
>
>
>
> On 11/19/26 18:10, Ian Rogers wrote:
> > pd692x0_fw_reset() and pd692x0_fw_write() return negative errno values
> > from i2c_master_send() directly as enum fw_upload_err instead of
> > FW_UPLOAD_ERR_RW_ERROR, and pd692x0_fw_recv_resp() ignores negative
> > errors from its trailing i2c_master_recv(). When a negative errno is
> > propagated to the firmware upload core, fw_upload_error() rejects it
> > as >=3D FW_UPLOAD_ERR_MAX, logs an invalid error code message, and
> > reports "unknown-error" instead of "read-write-error" via sysfs.
> >
> > Return FW_UPLOAD_ERR_RW_ERROR on I2C transfer failures and use
> > enum fw_upload_err consistently across the PD692x0 firmware upload
> > helpers.
>
> Please write a readable commit message with human hands.
>
> > Found via Clang -Wimplicit-int-enum-cast on an x86_64 allyesconfig
> > build. Verified by building drivers/net/pse-pd/pd692x0.o with LLVM=3D1
> > W=3D1 (-Werror) and -Wimplicit-int-enum-cast, and with a standalone C
> > reproducer; not runtime-tested on PD692x0 hardware.
> >
> > Fixes: 9a9938451890 ("net: pse-pd: Add PD692x0 PSE controller driver")
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >   drivers/net/pse-pd/pd692x0.c | 81 ++++++++++++++++++-----------------=
-
> >   1 file changed, 40 insertions(+), 41 deletions(-)
> >
> > diff --git a/drivers/net/pse-pd/pd692x0.c b/drivers/net/pse-pd/pd692x0.=
c
> > index 7958f5741463..94a857eaa3de 100644
> > --- a/drivers/net/pse-pd/pd692x0.c
> > +++ b/drivers/net/pse-pd/pd692x0.c
> > @@ -1455,6 +1455,8 @@ pd692x0_fw_recv_resp(const struct i2c_client *cli=
ent, unsigned long ms_timeout,
> >
> >       /* Read remaining characters */
> >       ret =3D i2c_master_recv(client, fw_msg_buf + 1, msg_size - 1);
> > +     if (ret < 0)
> > +             return FW_UPLOAD_ERR_RW_ERROR;
> >       if (strncmp(fw_msg_buf, msg_ok, msg_size)) {
>
> The error will be catch anyway by the string comparison. If you want to
> add a check on ret then add another error message.
> This is not a fix.
>
> >               dev_err(&client->dev,
> >                       "Wrong FW download process answer (%*pE)\n",
> > @@ -1465,9 +1467,10 @@ pd692x0_fw_recv_resp(const struct i2c_client *cl=
ient, unsigned long ms_timeout,
> >       return FW_UPLOAD_ERR_NONE;
> >   }
> >
> > -static int pd692x0_fw_write_line(const struct i2c_client *client,
> > -                              const char line[PD692X0_FW_LINE_MAX_SZ],
> > -                              const bool last_line)
> > +static enum fw_upload_err
> > +pd692x0_fw_write_line(const struct i2c_client *client,
> > +                   const char line[PD692X0_FW_LINE_MAX_SZ],
> > +                   const bool last_line)
> >   {
> >       int ret;
> >
> > @@ -1478,19 +1481,12 @@ static int pd692x0_fw_write_line(const struct i=
2c_client *client,
> >               line++;
> >       }
> >
> > -     if (last_line) {
> > -             ret =3D pd692x0_fw_recv_resp(client, 100, "TP\r\n",
> > -                                        sizeof("TP\r\n") - 1);
> > -             if (ret)
> > -                     return ret;
> > -     } else {
> > -             ret =3D pd692x0_fw_recv_resp(client, 100, "T*\r\n",
> > -                                        sizeof("T*\r\n") - 1);
> > -             if (ret)
> > -                     return ret;
> > -     }
> > +     if (last_line)
> > +             return pd692x0_fw_recv_resp(client, 100, "TP\r\n",
> > +                                         sizeof("TP\r\n") - 1);
> >
> > -     return FW_UPLOAD_ERR_NONE;
> > +     return pd692x0_fw_recv_resp(client, 100, "T*\r\n",
> > +                                 sizeof("T*\r\n") - 1);
>
> This is not a fix, just moving code around.
>
> For the rest, FW_UPLOAD_ERR_NONE is similar to ret =3D 0 so there is no
> real issue, only some type mismatch and I am not sure these changes
> should land as a fix.

Sorry for the noisy diff and dense commit message - you are right that
pd692x0_fw_recv_resp() (where fw_msg_buf is zero-initialized) and
pd692x0_fw_write_line() didn't need touching, and all that type churn
buried the actual change.

The only two lines that return a negative errno (-EIO) as an enum
fw_upload_err instead of FW_UPLOAD_ERR_RW_ERROR are:
  1. pd692x0_fw_reset(): 'return ret;' when sending "RST" fails
  2. pd692x0_fw_write(): 'return ret;' when sending 'P' fails (whereas
sending 'E' right above it already returns FW_UPLOAD_ERR_RW_ERROR)

Would you welcome a minimal 2-line patch for net-next (without Fixes:)
just changing those two returns to FW_UPLOAD_ERR_RW_ERROR, or would
you prefer leaving it as-is?

Thanks,
Ian

> Regards
> --
> K=C3=B6ry Maincent, Bootlin
> Embedded Linux and kernel engineering
> https://bootlin.com
>
