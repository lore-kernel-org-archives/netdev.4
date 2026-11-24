Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795535608;
	b=HkUmkyWLLQcznT2DOrSnp0tQWejyj9X+dR1vgOfkHzEOpz2mMXsmJ6hgIGnpt3HCcEjs
	 +tJJPaGG//8sXFozYsuYLlBSmHl50fbTWcgv1LwKlzpbLeymNZl7RkYO2Nt4ZQq8z7R9W
	 07+6PrRMjn/lnzOSi78JUQ6D8SDm4eDDBEKHIir7eSYGdx2PgepZMVOBrot0p7niuk+RW
	 wVvDPX+8OcBqfuYqdRb+14n6NDLOglmIPe9Eqa9pZJhtfxeemB3S8NjN33zFsMz1gxccj
	 G61fWTMmlhizlWygiqAavsfUCsBa1sicfdEoCX6UeJ2BzSquwDj+6L+uOityUVkGsmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795535608;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=HAbaKpAXtfda70HEA8mpf5g5mt2TC8wb/qxPCub+us0=;
	b=Lis8dyEfex7xSO6oOYFwxc78etUG78YGZNKlHb5sKrbg8dfvzAYn69g+mt12hCzrGolH
	 OH7SpfL2ZM+W7K9vb7/pfeXrQb+1Phk8MC/JgMS2kd3mv8TsVMWc9AjCIatDohYA6MbqI
	 zec8W+QGcRBuaqs1nLKZmLF0nNLCKM5SrGEryzLVrgbVCT1015nDpI5fz+GH00yJR2ww6
	 dGeD5OQzNmtJFqV5cJNJ9fNhFPSdYg07jtOl7nm+fDNF1kzJUEhzL2piEqbBu4lcLum1k
	 q8Kn8e4n1keSe4pwFV2rfjVkh+8OzzONW0/BGrhu9UPTChlniDdYDjG8hDb2LwvMpjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M2cYmcZM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46906606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 15:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M2cYmcZM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9DD11F000D2;
	Tue, 24 Nov 2026 15:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795535607;
	bh=HAbaKpAXtfda70HEA8mpf5g5mt2TC8wb/qxPCub+us0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=M2cYmcZM49nCQSs51/O+Rr4P8a3xyGcFFYP52A4hg8XLyHsHlGGrfHB+5aV1MBzQD
	 8V9GyNeGhL+/FOK6EuBAfJ/Y/KhnNlz7GAnVhdGf4lplLQ/0JD9NWGIkMI/7kjAJ9R
	 wFF5DSvNBkffuxKtmdL8TI1X/rtiMxVTtbaR7NZsABOHCPKk6qF7/wOnnvHcFpZD2r
	 BCa7ukQawMOSQJ+Wcs9ZSMl7u6n3MMOkFwCVajKpJbCXuyTTwBFl2lmEL9EW8uNN1v
	 msm+Jrs9L93kJfPvVUVQl10r5khik+hdh2veC8JQYqSlnQWwPkhjfeEqR5HKeEG/mZ
	 DBKeBG5szqHwQ==
Subject: Re: [PATCH net-next v2] tools: ynl-gen: avoid shadow local variable
 declarations
From: netdev-bot+sashiko@kernel.org
To: horms@kernel.org
Cc: donald.hunter@gmail.com, kuba@kernel.org, davem@davemloft.net,
 edumazet@kernel.org, pabeni@redhat.com, ast@fiberby.net, cel@kernel.org,
 netdev@vger.kernel.org
Date: Tue, 24 Nov 2026 15:53:26 +0000
Message-ID: <179553560643.3135.4325165389540156144@kernel.org>
In-Reply-To: <20261123-ynl-scope-v2-1-f5b8c6bb31c1@kernel.org>
References: <20261123-ynl-scope-v2-1-f5b8c6bb31c1@kernel.org>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In `_multi_parse()` (tools/net/ynl/pyynl/ynl_gen_c.py), the
  patch moves the per-attribute counter declarations `unsigned int…
- [Low] In `_multi_parse()`, the patch removes the block-local
  `ri.cw.p('unsigned int len;')` from the multi-attr string branch but…

--

tools: ynl-gen: avoid shadow local variable declarations

This commit moves the block-scoped len declarations in _multi_parse() to
function scope, using the set-based mechanism from commit 099902fc66f8. It
also renames the size_t variant of len to size, so two variables with
different types don't share a name in the same scope.

> diff --git a/tools/net/ynl/pyynl/ynl_gen_c.py b/tools/net/ynl/pyynl/ynl_gen_c.py
> index 4aca51396a9e2..80b541619df49 100755
> --- a/tools/net/ynl/pyynl/ynl_gen_c.py
> +++ b/tools/net/ynl/pyynl/ynl_gen_c.py

[ ... ]

> @@ -2218,7 +2218,14 @@ def _multi_parse(ri, struct, init_lines, local_vars):
>      all_multi = indexed_arrays | multi_attrs
>  
>      for arg in sorted(all_multi):
> -        local_vars.append(f"unsigned int n_{struct[arg].c_name} = 0;")
> +        aspec = struct[arg]
> +        var_set.add(f'unsigned int n_{struct[arg].c_name} = 0;')
> +        if aspec.type == 'binary' and 'struct' in aspec:
> +            var_set.add('size_t size;')
> +        elif aspec.type == 'string':
> +            var_set.add('unsigned int len;')
> +
> +    local_vars += list(var_set)

[Severity: Medium]

Can this make the generator output differ from run to run?

The n_ counter declarations used to be appended in sorted(all_multi)
order. Now they go into var_set. The order of list(var_set) follows
Python's set iteration order, which depends on the randomized str hash
(PYTHONHASHSEED).

After that, CodeWriter.write_func_lvar() only does:

        local_vars.sort(key=len, reverse=True)

That sort is stable and uses only the length. Declarations of equal length
keep whatever order the set gave them.

This looks reachable in-tree today. In Documentation/netlink/specs/nfsd.yaml,
the server-stats-get dump reply has the multi-attr members proc2-ops,
proc3-ops and proc4-ops. They generate:

    unsigned int n_proc2_ops = 0;
    unsigned int n_proc3_ops = 0;
    unsigned int n_proc4_ops = 0;

All three have the same length. Their order in the generated nfsd-user.c
parse function can change between runs on the same spec. That hurts
reproducible builds of the YNL user library. It also defeats the
filecmp.cmp() check in CodeWriter that skips rewriting unchanged output.

The n_ names are already unique per attribute, so they don't need
deduplication; only len and size do. Would it work to keep
local_vars.append() for the n_ counters, or to use
local_vars += sorted(var_set) instead?

The commit message also doesn't mention that the n_ declarations now go
into the set.

>  
>      ri.cw.block_start()
>      ri.cw.write_func_lvar(local_vars)
> @@ -2304,13 +2311,12 @@ def _multi_parse(ri, struct, init_lines, local_vars):

[ ... ]

>          elif aspec.type == 'string':
> -            ri.cw.p('unsigned int len;')
>              ri.cw.nl()
>              ri.cw.p('len = strnlen(ynl_attr_get_str(attr), ynl_attr_data_len(attr));')

[Severity: Low]

This isn't a bug, but should the ri.cw.nl() be removed along with the
declaration?

This branch is emitted right after block_start() opens the
if (ynl_attr_type(attr) == ...) block. CodeWriter.p() writes the pending
newline before the next line, so the generated C now has a blank line
right after the opening brace. checkpatch flags that ("Blank lines aren't
necessary after an open brace").

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123-ynl-scope-v2-1-f5b8c6bb31c1%40kernel.org
