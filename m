Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.83
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685028;
	b=rZHogb6iN+pkK2TWfcf5wc2Oe4WeNJSlGBQzZgkqNv67u4zP/jhiqLqruZmP+P33/xNv
	 yNrj+KcjtT9KsPlmceUa5CQcqNhsk7hd8xTAlr09gskaeIZvFyOOc2tI+EmKjk3cNJuwh
	 4mnn8teJQGHmt0dfI+lfUjQYD1IIYtE96xx3ydYvHMFt3HjdHDFcd+ahATy6TfJx/lXwI
	 e9KHsRaxU0Q7R3oiqNlpJ3BjHPlzWosTIWoMU8rRZeK4M8Utx1EjGUJBc+reumKkPJw7+
	 ED/bFqF6r7F20mDR9TacJExfROBxyogs5/FHzoT4IyDS7B4QMZGqhcP+JDoU7Jty+Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685028;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=5/hmL/5YenNKxna3pbqKAQxsiIs+mcdwyrmtudaVzyg=;
	b=bGjkFNP+WBDIo4vu16jtx7RBbtN4bLk5RcxG1dAl6lQB7SdzIxjbaZC18Pmva5rovYpe
	 r6kK5/9ex+N2SV1VE/g0y5ih9HkrIx9X+0DTfRZTg0gv9n2muTLZKDEr/EEQMf+AV8T16
	 opfy2SPkxnXp3ObrnJPpWbQToDZNyPw4xTOGhzJlcVo/unf7ezZBt27Um23IQw8f8O9XL
	 2PIrfxtZf2sTtxuCwrXvrzITGSH4rL/kGD5KRxA+7ptEZcmMPudTIrkQMfU0rlrPWY5Ro
	 657msyFzmqQLp/AtF3lSUA+ciC0Ro4OwK1vePJfacCNsgtZds5fORlSg29gZqtNrxQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QagV6h3T;
	arc=none smtp.remote-ip=95.215.58.83
Received: from mta1.migadu.com (out-83.mta1.migadu.com [95.215.58.83])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B98E606A31E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 09:23:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B98E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QagV6h3T
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=IXk0YjApNqhwO4WOhdlld0wJ7HXpUsU43ydhjyvNR9c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795685024; v=1; x=1796289824;
 b=QagV6h3TrAixwjEY05KD7NC7kK9dNjhuVqE4iqwta1OBQl8vw2LfGeY8mq0DLNFftSUN3bU/
 zClW0I19njLz9XMyVXdRorG963BlPX8feL8wl1XiH/XEl2PSTW/tK+tojHy35IDtIy8mbVM1tIy
 gjca/wvs+v5UziDBlWRSS5+4=
X-Envelope-To: netdev@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id e96f05ea7a9315ff;
	Thu, 26 Nov 2026 09:23:44 +0000
X-Mizu-Trace-ID: e96f05ea7a9315ff
X-Migadu-Flow: FLOW_OUT
Date: Thu, 26 Nov 2026 17:23:37 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Zhiqi Zhang <zhiqizhangg@gmail.com>
Cc: Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] tools: ynl: reject missing regen path argument
Message-ID: <20261126092337.GJ33976@Liu-laptop>
References: <20261125070354.18200-1-zhiqizhangg@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125070354.18200-1-zhiqizhangg@gmail.com>

On Wed, Nov 25, 2026 at 03:03:54PM +0800, Zhiqi Zhang wrote:
> ynl-regen.sh expects -p to be followed by a path.  If -p is
> passed without an argument, $2 is empty and shift 2 fails without
> consuming $1.  The option parser then keeps looping on -p until
> the caller kills the script.
> 
> I found the issue by manual code inspection and validated it with:
> 
>   timeout 2s bash tools/net/ynl/ynl-regen.sh -p
> 
> which used to time out with exit code 124.
> 
> Reject -p without an argument before shifting.  Also stop if the
> selected path cannot be entered, so the script does not continue
> from an unintended directory after a bad -p path.
> 
> GPT wrote the code change; I reviewed and tested it.
> 
> Tested with:
> 
>   timeout 2s bash tools/net/ynl/ynl-regen.sh -p
>   timeout 2s bash tools/net/ynl/ynl-regen.sh -p \
>     /definitely/not/a/kernel/tree
>   bash -n tools/net/ynl/ynl-regen.sh
>   scripts/checkpatch.pl --strict --file tools/net/ynl/ynl-regen.sh
> 
> Fixes: 25b5a2a1905f ("ynl: regenerate all headers")
> Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>
> ---
>  tools/net/ynl/ynl-regen.sh | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/net/ynl/ynl-regen.sh b/tools/net/ynl/ynl-regen.sh
> index d9809276db..524fadb770 100755
> --- a/tools/net/ynl/ynl-regen.sh
> +++ b/tools/net/ynl/ynl-regen.sh
> @@ -9,13 +9,20 @@ search=
>  while [ ! -z "$1" ]; do
>    case "$1" in
>      -f ) force=yes; shift ;;
> -    -p ) search=$2; shift 2 ;;
> +    -p )
> +      if [ $# -lt 2 ]; then
> +        echo "Option -p requires a path" >&2
> +        exit 1
> +      fi
> +      search=$2
> +      shift 2
> +      ;;
>      * )  echo "Unrecognized option '$1'"; exit 1 ;;
>    esac
>  done
>  
>  KDIR=$(dirname $(dirname $(dirname $(dirname $(realpath $0)))))
> -pushd ${search:-$KDIR} >>/dev/null
> +pushd "${search:-$KDIR}" >>/dev/null || exit 1
>  
>  files=$(git grep --files-with-matches '^/\* YNL-GEN \(kernel\|uapi\|user\)')
>  for f in $files; do
> 
> base-commit: 7ccb044c27720d48175577080b851f047ddcfd1c
> -- 
> 2.54.0 (Apple Git-157)
> 
> 

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
