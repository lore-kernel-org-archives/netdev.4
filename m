Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795629035;
	b=zxSjKNKXp9YXv2JFpn+6Zpok0MX3jGykqLbHw2+0cD7XOaU6M9W/14qkuZGzpmZ26qA7
	 WnUwF6Aynj4e58gYc+1P+rasYxk3sqOL7BC8aCIGpscMHc7z8u2kC6fATa1FuERgUnFP7
	 akwS2MO/fVbgH2Rxh3ZK7astHjsvHICFHMKDradm3JPM8Tka6SPqXSa1nuXYES8a45pD1
	 l/PelO4C1rLYpjM1TiyEqjMS0/wGvUzEiE7l+t+J1dUFjCLDu6PpbvHxCEixSdoUPQc5n
	 DdgN2sAyrJcNOvCOpCrOn6O+2XvU4edF93UVZjDInGtfrEKXtIb8JPxB8qVi0irGkKQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RfPxo/aBNHz+uEsj4QdIP7gFGpuoo0qtgUa4pVHLuDE=;
	b=VOZEbVPcMZV6zHLNmhbfLhZ4/PKXf/+7cb40G0eeeYF3U77jD+1oYaCWu0SXnEgc0rH4
	 V1EVK8KkQBHQ1ZMUp0vlM2ORK+AV8xU3tKew/Rs+W4xhI+5A28lTEYlPfYLDdqsiL2Qjq
	 gmVwOTm6iciSEi7H0rRDpyE/SLtZBUSwP5D6RUDB3HvbqEvbNnAZTMfn9B5StDmUz2Ci+
	 siwrb8jWv4Goy4lWa6eyBOdM6G9nRnV8Cx9CL8x6AnhjwZO2MFVG9z9l35tKcwQemLPWo
	 JSRem4aGynUWsKcaEP9OmSXGRa5S2mDMzPdl8vTUZMqs5uTxYqNVTq3SBVpgSwhnotg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RzrnzIOd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67F6606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 17:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B67F6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RzrnzIOd
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so3967735b3a.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 09:50:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795629034; cv=none;
        d=google.com; s=arc-20260327;
        b=PMu37kiCLTg+Jg2FEGhgXGDE2bh66plEZTyqppVC8Eidip00DmcccGVsPKYTiXzHYo
         v2gk6a9jzv7puTABrA6KNJfGYTI2/5kFaqGKSt5jlWCF/8vMIskRkeaHutQvFq7pwV1W
         t1oZWFH2p9fccst/bOaJfXDQ61zbXM9DUnOcc9hQ14DwcC0wKf3Y8tkYTA4XYrVXDale
         FpalAEDoqFi6b1/pW1bdGl3P6rnTWXGNQiFf75L6/Xlzi1jJ8fstX4cA7tr/qJib5zcj
         6IeMMQiGSdSjI1f/oC8uKoEzlvYcJmwk3008TY+v/W4d8AazYmoyich1l+G2M6sIzhDB
         IG9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RfPxo/aBNHz+uEsj4QdIP7gFGpuoo0qtgUa4pVHLuDE=;
        fh=mwuV+J5KfEnD+MZnJzyq1IdwjC9quihGwCFcGb2ZwI0=;
        b=fBa6rKagqfG32c6qEARJGQpEDx1CU5IROTFAaSrFi1flfSUJOmGFR3D3Qwc9Pupta/
         TdFUCtNZK02W6V4vwcxQHMvzXbBcurEHIkMjqZ9hSEwDsn99g5mkickRHeBPVFsAfZnu
         q5ru3iVg2E0/mYLiXyBtN7/P88915RBSGVa8pA6fkn0jSWKiF84UuPCuqqH4MeSNB8tu
         pnwpVQn4CaK2eeD3CcL350vwyP+gxzF+ZNj1BeZvM6PfUmal4+z1gI4wguFYUUrwt5SL
         djsOdpltN5Ym6ZPt+LYgFNBKwlp8nd0NF3LaNLcFzEc5/bifsJAu/Gaof54dsTHZd0z1
         uWug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795629034; x=1796233834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RfPxo/aBNHz+uEsj4QdIP7gFGpuoo0qtgUa4pVHLuDE=;
        b=RzrnzIOddMSy0/gtb8UILgu3s7kq+AW6xMj8vnNYFlLsUstmpxo2bu+ZL/+t6ZA395
         ZgNjTGGZS8Iis6a1xMG3pPHiF2pS+lzMfEdajHXNHC5vIkDtY1ektkGYxh8fsCEalPl9
         bjMP/hJ7scXuutgpkiha1/sTpcU04wlV7ZKqA0HzLXF7oLzTSRsn+6PhBIY/WfOIKf4E
         iqJq81myqrwEybsZpA0H1mbCincek5Sez0jIQsuMApfR3WrPaLdWWts4UzTTARM+UOKF
         1VJYEVYhGBCh8rM6LzVZGGxsitpbmTDtypVh4HvV2IdxbHox3ImYtRQggVwFMdKbuohZ
         5e7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629034; x=1796233834;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RfPxo/aBNHz+uEsj4QdIP7gFGpuoo0qtgUa4pVHLuDE=;
        b=qpGV+l0AIiEloptlH7DwBbwHzKypXOYDyhEnI8ylL6tTRXeNqXGCXwITvO3eyUKxz2
         guc2SUq3ItUn5AJmqgovS4BV2LqxMViJHdsot7T8n4NpJjv1UcIcm/3h1Mw199TNay+8
         iX9bEgMHHx/wPQ/M9FjFM7CkhJ6wcuCc6CyZrE89ghJbh2LFTMq3+Ax8nzLlmGMQlw2Y
         8mvBB0KPP/6CI8u/2BNqqbZkP2lmmVzizCUVh2giyWhGQJ5A0kGwbWpFagCTnpG+RkQR
         dwR01htO9O/4IC6ZWcVB6Sp6PHZFVZMDR2453Y/jYZzWFYzxilCwCEh8l6mqVtJUHv+E
         aPTg==
X-Forwarded-Encrypted: i=1; AL+hErGuFItvxdHW1PaywlBX/uJ7pw/hoPxK/Uw8IT+5rys1z0lYOkYJdWiwfCN4UhfzawBMzLouH3Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eQpW/Vzmn71pfgjmre5tpy9kvuDsa2gtH9Q5MvdP80EKjzZZ9
	/iF64rg5TwUbbGPt2qhgfoGntkfpvSIKvQQmc6DbcJKenjrSrmW9TRSh4SpmYXq1ZRrFxx2iGKu
	MHwWWOcraRlMTxCN9++5i+pxDZHi2UOo=
X-Gm-Gg: AZFdTZdnHc854w4WZzAFo8h4HUREu3T5uTjSSp6PQ/Fr8ZRCmo3g8o3PlANFehWn/3r
	VGLpZXa+/56yOpshocp5vXJSVoDOYxYU+dQSwaIjr41JyqnesZNzmkkxcbJ5lUe6SscqV5ZQILi
	qS+9L1hhhUk7XSRxLq0iIgPEEs4f7/SD+uGTIpSU8/NyN5RqajVVPGprS2QI/+L6CB4Fx6Yrkak
	STEDJbyV2v5nCTwjeeAdUmvsGQ+fYLTmYhwTNZlFmj0Vo4P0Vq/4Z1KuCtkGOGR6BjgsxRJ1stU
	yss9OYRBWIuoNx2xnm9SF5m0mkInbH+7ksYBu6ZLeqWFmXv8xTd34+NLnOp79BPCb3lxBrPtdak
	9rLrs0brzfeWadZ3XeVMYBgIOH6+gRHQM6gvUK/9fiJXq4fdm3IGlDABHfYQv4FvQnHZqYmbOwb
	piHhjLP/b3W4EraKRcCwR5lyBpO3M8V5T3IUicLzU+TOzJj7cNwtV15GfLOeRYzc1QN2K7
X-Received: by 2002:a05:6a00:3686:b0:8b1:e117:3978 with SMTP id
 d2e1a72fcca58-8c87b4efa61mr19112715b3a.18.1795629034041; Wed, 25 Nov 2026
 09:50:34 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124022107.32283-1-ljp1205831794@gmail.com>
In-Reply-To: <20261124022107.32283-1-ljp1205831794@gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 25 Nov 2026 12:50:21 -0500
X-Gm-Features: Aa3M54rTrVlRJogvLdZlOlBUntzVGX-lKN5GyjMtLtm6uLQGHabDbIb2QZZt7fY
Message-ID: <CADvbK_ekpmyug=RZ4nLUotK7jimxKrw9gUiEyF0zzopM-rzPUw@mail.gmail.com>
Subject: Re: [PATCH net v2] sctp: preserve the peer transport during INIT
 error cleanup
To: Lin Jiapeng <ljp1205831794@gmail.com>
Cc: marcelo.leitner@gmail.com, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	vladislav.yasevich@hp.com, linux-sctp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Lin Jiapeng <jiapenglin@tencent.com>, 
	stable@vger.kernel.org, TencentOS Corvus AI <corvus@tencent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 9:21=E2=80=AFPM Lin Jiapeng <ljp1205831794@gmail.co=
m> wrote:
>
> From: Lin Jiapeng <jiapenglin@tencent.com>
>
> sctp_process_init() removes non-ACTIVE peer transports when INIT processi=
ng
> fails. The transport matching peer_addr may itself be UNCONFIRMED, becaus=
e
> sctp_assoc_add_peer() only promotes an existing UNKNOWN transport to
> ACTIVE.
>
> If no ACTIVE transport remains, the cleanup can remove the last transport=
.
> sctp_assoc_rm_peer() then interprets the empty list head as a transport a=
nd
> passes the invalid replacement to sctp_assoc_set_primary(). KASAN reports=
 a
> null-ptr-deref in sctp_ulpevent_notify_peer_addr_change() through
> sctp_assoc_rm_peer() and sctp_process_init().
>
> Keep the transport matching peer_addr while removing the other non-ACTIVE
> transports. This preserves a valid replacement path without retaining an
> arbitrary UNCONFIRMED address from failed INIT processing. On a live
> COOKIE_WAIT association, T1-init remains armed and can continue using the
> retained transport until association teardown. Successful INIT processing
> is unchanged.
>
> Fixes: add52379dde2 ("sctp: Fix oops when INIT-ACK indicates that peer do=
esn't support AUTH")
> Cc: stable@vger.kernel.org
> Reported-by: TencentOS Corvus AI <corvus@tencent.com>
> Link: https://lore.kernel.org/netdev/20261112092114.12458-1-ljp1205831794=
@gmail.com/
> Signed-off-by: Lin Jiapeng <jiapenglin@tencent.com>
> ---
> v2:
> - Keep the transport matching peer_addr instead of an arbitrary last
>   transport, as suggested by Xin Long.
> - Update the subject, cleanup comment, and commit message to describe the
>   retained transport's use by a live COOKIE_WAIT association.
>
>  net/sctp/sm_make_chunk.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/net/sctp/sm_make_chunk.c b/net/sctp/sm_make_chunk.c
> index 15c2d87575a8..65594eaaeacd 100644
> --- a/net/sctp/sm_make_chunk.c
> +++ b/net/sctp/sm_make_chunk.c
> @@ -2525,10 +2525,14 @@ int sctp_process_init(struct sctp_association *as=
oc, struct sctp_chunk *chunk,
>         return 1;
>
>  clean_up:
> -       /* Release the transport structures. */
> +       /*
> +        * Release non-ACTIVE transports except the one for peer_addr.
> +        * Keep it so sctp_assoc_rm_peer() always has a replacement path.
> +        */
>         list_for_each_safe(pos, temp, &asoc->peer.transport_addr_list) {
>                 transport =3D list_entry(pos, struct sctp_transport, tran=
sports);
> -               if (transport->state !=3D SCTP_ACTIVE)
> +               if (transport->state !=3D SCTP_ACTIVE &&
> +                   !sctp_cmp_addr_exact(&transport->ipaddr, peer_addr))
>                         sctp_assoc_rm_peer(asoc, transport);
>         }
>
>
> base-commit: 145480b28ca82e9fae789427cc4569e596515a32
> --
> 2.55.0
>
Acked-by: Xin Long <lucien.xin@gmail.com>
