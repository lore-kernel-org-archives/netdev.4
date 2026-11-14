Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794694353;
	b=JRJR0k06r6TMI532fo0Ncc0vqqo7F3ysChhPUYVSPv3GUUSvnr014kVnZ4g2mnxOWxF+
	 /lIr8rZ3ETcysmxFRwvcPyVP3HjYS6etyuCJPqMDK26S3raephttKBei+2Ag9p8stbdxb
	 CxOQPc6FLZiDUodq5Ilj5N+VoOngIuMhf+DBiuS2VCBruWEBsvY2vOm4c7Z6cz1pVN8Ty
	 QHPpAv9P57ItA4/qttRsyZ5n0acH8efDfsdHlF9oXgqC6wOjGWW2r2xjwBhMRa05P76I2
	 1L5y6nahpYlatwwd0GshZrSMTkxR7gHsO7hWzR8dRI+k0KyilOSSUpYnSejJJs6fRoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794694353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Joy6pCzJt3sMEVX0YEQOOXuKEFZ9hUsTWE52ZQj/p1w=;
	b=fD93KEg2z36teqpNr4PEGx5VHjWABjfqZf9l/WhCAlYXQ5wBxj0/Nw6Zf0wH69RpiKTq
	 2UUBwM1s4XbjUStZM4nN48OK/YZLzoMW1qb1+2bb3pE5Vtze0KHg+DfNxEml3ys4mq9on
	 dC/n9+wHNNMnS80drI2fgQ2PnvKvWCWvvbwF+1BlOmUcxUC16HjXXjHfCDGbH6BbgZ7HW
	 mtyZ+9JbzfYW+4kgNxtrcWyqV2ZysZSFMie0n3ygzTgWwDhfLjUzW1X8Cxv0sCkCLp8SJ
	 FMbO+U4qcXaOpUNK2eazb9HnWddKF58EXRPTbg282lYlAh6R/j5vmNe0SvmiEHz3WBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cyX1qftW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93F8606A32E
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 22:12:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A93F8606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cyX1qftW
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91c1f548f87so48413026d6.2
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 14:12:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794694351; cv=none;
        d=google.com; s=arc-20260327;
        b=jEg6toQTWvV+jXlDOEMfbdyJeyWbPjJhfBKFO3mEVbJnd0qFN6+tsDb4091CqCOfna
         fWoBcfhcEXFH2KHAyhXELRitDTL4T8C09RVDgd4Hbp6cwjcJ3xLH4J59Q3GSNZQ+H0pz
         QgVL1QqXxWGLLJpF00ahFeHL2J/z1VaRAW2+cfvkc/OMFQ4RDeT4ck+QqOyAAl3blNRI
         pdn06Xo206B9foIXDH1+OcWcRzYstGF5wX7Obk79ZeSVmWdLNDv9JIVsDT5cbs1O6A9T
         lOcaUpdR+I3TmMRRQnd9BbFbLTNCdK/ef1N6ZM3hOo1GmQyPfMcAJXHe+XdKa+Le9oNc
         YUHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Joy6pCzJt3sMEVX0YEQOOXuKEFZ9hUsTWE52ZQj/p1w=;
        fh=spqLSit1FAIp7UJb6WfUcHf+6UF1HfBNLCo0MyPM1T0=;
        b=I7KrbEneS0mBsMgatQdsPWem+UXYSJKQxW7CWb9KTaWOecQCjO/t5ryp5bxxEk8tH9
         2uS35Is57PxAcBsVfboDdrYpNBJH3Hl9Vg7qWsSlwshbg4m3+PnHuN+CpFf7ixezh7mR
         VNcfclPtIPMUvE00bw3ETvtT+wiKo8ff8GJi0fbcSZbCMgZpXntyzEP1svyM34WVRXYC
         HvZKHkcNcXs9gxrfS6jYD4lwOx4F2JMG+2Wtls1jImRvrCjnRZU7ZbraueFrww029HRy
         RLZhGpx9hgOltP6X/974sozvD2gmWWP2a69F76SZ7ftZwUVvXMHnnhTnY+IEcYGzj8qy
         5fsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794694351; x=1795299151; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Joy6pCzJt3sMEVX0YEQOOXuKEFZ9hUsTWE52ZQj/p1w=;
        b=cyX1qftWtwvD+qFdY3iMolNryWltoehzUt9OxCv4PmJSBdrCWDMGnhyf2/7Ir9dikC
         Pc1cMqeWjyjiS1PTtOLjbFu6pKwF6xJa2cmB0ZaJgNpOSHgtIczvFE7OX6+qmIUrpQ28
         5lzdL/Fkq1Se20YLQ+z4Jei4/H9aAq6gPiYbBuyAyn/8yNcyeS63v0iOvkavQukTYVpx
         Lzd869DJ/mYahcxW6wy9ltwa6Z/R9RzG1pfrX41ZI9BCCXVGNdv8PFqr3vP7aFjyVi89
         MsZt3ySSs0qBki0X+QFXXQh17SF79xVBBJbpP3x/1dmZ9UbpFSwPku3UsezS1NXMAjbY
         oI+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794694351; x=1795299151;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Joy6pCzJt3sMEVX0YEQOOXuKEFZ9hUsTWE52ZQj/p1w=;
        b=arStZwK01pfIZzTa0y8tmSShO9vHBecJh2kMBHepham+3vaygTEq4umZ2udJ0U2hzc
         crkdK8c/cnLES/MIwROMDbp+gYPWaqrmL3FBT2AVuz4jCcMNIPqvJYx2jfGyA2X7NjlX
         EF+ooGTrGV+RElbqTqfnAGv8nVq6vBZi7B2DB91wXE8JVBB2quyyNwjx9/ckyWSglAiK
         shCJeqiJbN0wzlpfYlq2qYKbzR9TkWlt/24gKS6OAturU3K9xfo1fTaq1fUAybiCeg2I
         EkRIp0tVjOVhvE9bylbbrUOyl1aTrldQaL5xZqHjVWJc/JJ59CzKseY1KyT+v8KjOllb
         5C1Q==
X-Forwarded-Encrypted: i=1; AL+hErEYKqnE6EU4WBXr4PTj/dKelhPvXPODPbUZTWNvRkoM9j+/E6HXezvGHMAU+BaxBiUTz0Xq+d4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ANkd8fTdquToMOOIwZqtSimLLXYbzpqnraRLbjj97u9TnJwNJ
	C+dm6EXRrXvUaEdRy2ypIg8fAxjuXl5hyhu86uxlm7QO8Kk8wkm5ORdZB4r7G5ZytJ7KJ7V/SkO
	rXtlN4xv2Y/h80IxDpQyiZ7HEd7LHy9w=
X-Gm-Gg: AYBFou1iDU4wVjw7YFUAy5ujw23A82sIviGiWp4/OdJIVkOz+iEXypf3GLyewkfsOSG
	+aAg3r9yOfuTXcCU1MQ8aA9nhRj2IVU12oKBBUx7ME0JAv53OKR5aOuDgCQwqkG8Lsfsj4sSTGo
	NgMIKuO1hRuuI3unyp1KqsFepXZGMUkRwsB+/dospEhsk3dGVQmcXp82SUYOxR8O7ikzTp+kQjw
	qgTL/CkMuCm55KBjQRip1gS2tMddypEplyrEkCivwwg/l6E9WJB+vfwplRwQizMHpMtQmhprSYp
	tWGu+vJrxJv5QriKLuN8hXgg8FMwAbvgcOSnE0MJTEMSlogLs/J6ENw6H1s5EVz1tfGYr+7+uLs
	yikMC93tAiUxCCIY7axEipaf02xe8yE3R+mN2
X-Received: by 2002:ad4:4eaf:0:b0:91f:2698:2c3 with SMTP id
 6a1803df08f44-91f269803b2mr91524196d6.26.1794694351610; Sat, 14 Nov 2026
 14:12:31 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114050954.275495-1-artem122novak@gmail.com>
 <20261114050954.275495-2-artem122novak@gmail.com> <2a97f1a9-4d44-4837-9c40-57da3db9b73a@lunn.ch>
In-Reply-To: <2a97f1a9-4d44-4837-9c40-57da3db9b73a@lunn.ch>
From: Artem Novak <artem122novak@gmail.com>
Date: Sat, 14 Nov 2026 16:12:19 -0600
X-Gm-Features: AclHuK_aS08-lQYnPQiyXnO6fkaMqlI5ELaiOLXfFq43C5hcClmdK3mEhy3bEdk
Message-ID: <CAPufuhb4XrwiQoh6O6QP34gaujWm_wMBFvjxt+DGdO3YnqveCA@mail.gmail.com>
Subject: Re: [PATCH net 1/2] net: usb: smsc95xx: propagate MDIO reset errors
To: Andrew Lunn <andrew@lunn.ch>
Cc: Steve Glendinning <steve.glendinning@shawell.net>, UNGLinuxDriver@microchip.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Alexandru Tachici <alexandru.tachici@analog.com>, Andre Edich <andre.edich@microchip.com>, 
	netdev@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Yes, I did observe a failed PHY reset on hardware,
but unfortunately I didn't capture logs or document the failure at the time=
.

I'll move the patch to net-next and remove the Fixes tag.

Thanks,
Artem

On Sat, Nov 14, 2026 at 4:08=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Fri, Nov 13, 2026 at 11:09:53PM -0600, Artem Novak wrote:
> > The MDIO bus reset callback returns success even when reading or
> > writing the PHY reset control register fails.
> >
> > Return the register access error so callers can detect a failed
> > PHY reset.
> >
> > Fixes: 809ff97a677f ("net: usb: smsc95xx: fix external PHY reset")
> > Signed-off-by: Artem Novak <artem122novak@gmail.com>
>
> Have you ever seen it fail?
>
> net-next and no fixes tag please.
>
>          Andrew
