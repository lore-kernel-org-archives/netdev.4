Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795712700;
	b=egwDwTzXCwzkPjjtgFsUI9HJO1jXCXtH+PAarH4hL7Xo7pnX0vq8JLvpvC0GGVJN/Dby
	 2UtCKKNtviybL3JoCR30jbf+C+mDK7EDNyHV2ZMn2khIKPhjTH5KpOONSIDAeOYen3E5G
	 vAOo45fEXfcI82utHBOVK5iEeqG0Uw6CSfswpScsYSbDnoDik4pSgNtqWarv4YdD17bov
	 gXj+ScZu9x6wGx5hvoeDoq5Zfr6GnpzzUhiiHmx8pPBHtX2nQNyOS8599Hl1T8+8eixDD
	 x63/SdWhOIij/P7aKfQZabetaLfApdctOIHDM/GRpRPRN1IHP40XYMShx4BJXuInFxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795712700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=kcT+zGUVm9NECrDFd7+fwJkTsjEygvZ1aBy/ZV3pq+8=;
	b=mPzKcafE+BboHGA2ovAtrupQknXfTMR6huEqMdvExCpCkHfMXHDsuSSoOArZ+iVNWr8m
	 QXXPHj427KrkHm9mTj5aU1AG2iiENqBGUudL8Dqn42+8B9XzGeEaUOoQdTAfy/d1Ag/IK
	 ISodTY1jN+N4K+fv0F3ezXFVzT4k2MI9h248FZCaXbJA4GAJiqoH5Jax0TlW87zgn1xDe
	 U8bVw0aNPruUSZMsP2Th04IhxUcyionAfqFTIfyVMn5Kgrv82eKE1vcxHE3PtYk7nwoJf
	 LnGWw4MrpZuawZKzkoX64O3upKx076ViINUPZ+35mB1kGeCxeta0kg4ulg6FxBk6Pmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=YsKSPYuK;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD03606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 17:04:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FD03606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=YsKSPYuK
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so1160887166b.2
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 09:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1795712697; x=1796317497; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kcT+zGUVm9NECrDFd7+fwJkTsjEygvZ1aBy/ZV3pq+8=;
        b=YsKSPYuKw2yMM2IRKYFY2ZVr0kIG7DSX6Ovk+aXn7r/Hdv2SUo62AjLAJeV2JHfhvy
         oZm7E/tOhVj7N8zUMWSj+fKnDE0/JHoXmQSavCkkEeLgGwak7l2sIBe513n3CKmwv4av
         54WiCuGH4ApCjExSNBe+p5Df0yRjIf29HfHfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795712697; x=1796317497;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kcT+zGUVm9NECrDFd7+fwJkTsjEygvZ1aBy/ZV3pq+8=;
        b=vzWYRigb/Q5J3VwA/37HiZtXQM7Zf9RXzIDeMjMWYFXdtQ3FTAT9qxP+iyi7YVO0DM
         Xg8RMXC+GQkw08I6rHdqhX1fvSdeuuBGNV4gLqh9PnYPaI6PqXiz5NzeHvFJMdCnn7gO
         FESl/x5PEDWBtaA2cwUl5pVFVQbBaz/nGepFpwPSYG9dmir5eCrAPYR3m0qXSXGQN5of
         cu4VcWMlUu27REM/PbREurhDcfMbG+7BsyIEPwZ/JRd8J7K7LF1tvSB7fsXDQUYgCZN9
         1BxSJT3zuEjtPWAHNiAR0SAJhl8yAzmDkGwPBv26NTuq9s0W8X4UH6DZ+fyf5xzffEkW
         TVcg==
X-Forwarded-Encrypted: i=1; AL+hErH80zFKez9sGnFT0IemCSASz1CewdptpJQiiqIzTy4aKyi8nTCF26VBhVxWp73D5vPmGfACYmA=@vger.kernel.org
X-Gm-Message-State: APuU4Z++UF4vE/bDzDqxjhQ9Y8tI0mgbN4zHGThgH+cMVDXGL04L/Mdt
	B5cJkXmtpvv6s9ZOYjwIYOUu5HKBht+zZpSafQ/0SpA2e2PoWgPWaDeGzlhKwSVaZWaRWhDuxWP
	Z4xVl8n8=
X-Gm-Gg: AZFdTZdwR5MDK8QuMw0lYJT9mKQHoLg1jR/u8bGCVl31VxcXQVsPR6zEICI/VpnU/Bv
	y36suLJCffn9uMZ3niAqaUuJOMwXxx/G6Fl+SUoHZGRCplcqLEeH5eoorMhiRAndJEld7LY7Yxp
	xGyNjV5uCDXnETw5tjpIv3m7BiTXxdiqlfdPppDqsoYZ9SDVnl1apumnXnU1/ke7HdOOWBaIyMd
	etKxoA8XI8cjN9byRG0IcDxj8WEYOpLuLqjFcMId+cMH2rNQGq3vsdvvq3RHDYj75K2CfX2Xy7z
	9srDSYqPOJl6po5MetAT0q9ZKzx26KmgsjizXeuPz06R6Jq2kqqWU4JZls3PmFkSVS3gbqqRpxn
	0VOoYOtQyHK8GsIhgTHF4BY0w2dvGrJaSrRld35QFuEd/rLaYobyEXOdID5WoPfe68ix7nY6UEw
	o0J6fiWcKYUZ6Jl/AC8CpM+uOnD19jw2eCB5RDwd6J67I+Cd94QVswrPKj1HwR0syJA9PoMxx9s
	3f6ajTGs2nJGfXWV8Ql9cetmFghMyD11rGckV2TAvinbAsnRCgWzyC3E3u/oxw4fDUOBlwxZ8Ak
	k1jtKfW1K4HeRRTdOYLt7kypcQJ/PUSDaI1oXs0aaVN/UZyTQ/crMUxf0npTMKVAg95sB93juEZ
	fnlU=
X-Received: by 2002:a17:907:9283:b0:c51:b3bf:14da with SMTP id a640c23a62f3a-c51b3bf1f93mr458704266b.39.1795712697352;
        Thu, 26 Nov 2026 09:04:57 -0800 (PST)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afe01a0sm780588166b.68.2026.11.26.09.04.56
        for <netdev@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 09:04:56 -0800 (PST)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so1160885166b.2
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 09:04:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFkT2Hal+8/d7W7C7RQ0a6KLnFVeg8Uft7BgW1y02K/RWMNBx7zTUF+MDSkJ8pacEXkx47PX64=@vger.kernel.org
X-Received: by 2002:a17:907:ea94:b0:c29:f5d8:9c73 with SMTP id
 a640c23a62f3a-c513a9aa815mr1870553166b.34.1795712696391; Thu, 26 Nov 2026
 09:04:56 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126-lklm-sysctl-ctx-flatarray-v1-0-d7fc9cc9b03e@kernel.org> <20261126-lklm-sysctl-ctx-flatarray-v1-1-d7fc9cc9b03e@kernel.org>
In-Reply-To: <20261126-lklm-sysctl-ctx-flatarray-v1-1-d7fc9cc9b03e@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 26 Nov 2026 09:04:40 -0800
X-Gmail-Original-Message-ID: <CAHk-=wir6u-wFF8+V6DZTqJUsgvRrSpkZ_FV9QcK58G-b1N7bA@mail.gmail.com>
X-Gm-Features: Aa3M54os_jwm08rJOj6LitTJqSmdyD486qskvu_4qaUDpWGX1bG3bIuR7eJcvH4
Message-ID: <CAHk-=wir6u-wFF8+V6DZTqJUsgvRrSpkZ_FV9QcK58G-b1N7bA@mail.gmail.com>
Subject: Re: [PATCH RFC 1/9] sysctl: Add struct ctl_table_tmpl as a distinct
 template type
To: Joel Granados <joel.granados@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
	David Laight <david.laight.linux@gmail.com>, Wen Yang <wen.yang@linux.dev>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Nov 2026 at 03:47, Joel Granados <joel.granados@kernel.org> wrote:
>
> +/* Template version of struct ctl_table. Used for registering ctl_table templates */
> +struct ctl_table_tmpl {
> +       struct ctl_table t;
> +};

So I really don't like members named 't'.

I see why you are doing it, but maybe you aren't aware that we already
enabled ms-extensions, and you can actually use *unnamed* structs in
templates.

So you can do

    struct ctl_table_tmpl { struct ctl_table; }

and that gives you a new type that you can use without any "t." kind
of thing, but is still distinct from 'struct ctl_table".

Note: being unnamed is very convenient in some situations, less so in
others. If you actually then want to access not the individual fields
(which is very easy), but get from the template to an actual "struct
ctl_table", you'd have to use some explicit helper wrapper, something
like

   static inline struct ctl_table *template_to_inner(struct ctl_table_tmpl *a)
   { return container_of(&a->procname, struct ctl_table, procname); }

or whatever.

Honestly, right now you seem to do something really ugly: you have
that 'template', but then you hardly ever *use* it as anything but a
top-level interface, and you turn it into a 'struct ctl_table *' very
early. And that looks like it's done exactly to avoid the whole
messiness with the 't' member - but it also measn that internally that
"template" has lost almost all meaning, and it looks like a regular
ctl_table.

Maybe that's fine. But it feels like the template is less of a real
template than just a wrapper that is only used at the top-level
wrapper and then never again. That does *not* work well if you were to
add a few extra fields to the template (that is then *not* in the
struct ctl_table. because they are only used to set it up). Hmm?

              Linus
